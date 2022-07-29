//
//  FirestoreClientRequester.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

import FirebaseFirestore

final class FirestoreClientRequester: Requester {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    
    let db = Firestore.firestore()
    lazy var task = db.collection("settings").document("theme")
    
    func request<T: Decodable>(
        parameters: [String: Any]? = nil,
        type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        
        if let parameters = parameters {
            saveData(parameters: parameters,type: type, completion: completion)
        }
        loadData(type: type, completion: completion)
        
    }
    
    private func loadData<T: Decodable>(
        type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        task.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let dataDescription = document.data() else { return }
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject:dataDescription)
                    let model = try self.decoder.decode(T.self, from: jsonData)
                    completion(.success(model))
                }catch {
                    completion(Result.failure(RequestError.errorParsing))
                }
            } else {
                guard let error = error else { return }
                completion(.failure(error))
            }
        }
    }
    
    private func saveData<T: Decodable>(
        parameters: [String: Any],
        type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        
        task.setData(parameters) { err in
            if let err = err {
                completion(.failure(err))
            } else {
                guard let data:T = T.self as? T else { return }
                completion(.success(data))
            }
        }
        
    }
    
    
}
