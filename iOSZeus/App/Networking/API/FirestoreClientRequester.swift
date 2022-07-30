//
//  FirestoreClientRequester.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

import FirebaseFirestore

struct CustomRequest {
    let collection: String?
    let document: String?
    let parameters: [String: Any]?
    
    init(collection: String? = nil, documento: String? = nil, parameters: [String: Any]? = nil) {
        self.collection = collection
        self.document = documento
        self.parameters = parameters
    }
}

final class FirestoreClientRequester: Requester {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    
    let db = Firestore.firestore()
    var task: DocumentReference?
    
    func request<T: Decodable>(
        customRequest: CustomRequest?,
        type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        guard
            let customRequest = customRequest,
            let collection =  customRequest.collection,
            let document =  customRequest.document
        else { return }
        task = db.collection(collection).document(document)
        if let parameters = customRequest.parameters {
            saveData(parameters: parameters,type: type, completion: completion)
        }
        loadData(type: type, completion: completion)
    }
    
    private func loadData<T: Decodable>(
        type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        task?.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let dataDescription = document.data() else { return completion(.failure(RequestError.noData)) }
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject:dataDescription)
                    let model = try self.decoder.decode(T.self, from: jsonData)
                    completion(.success(model))
                }catch {
                    completion(Result.failure(RequestError.errorParsing))
                }
            } else {

                guard let error = error else { return completion(.failure(RequestError.noData)) }
                completion(.failure(error))
            }
        }
    }
    
    private func saveData<T: Decodable>(
        parameters: [String: Any],
        type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        task?.setData(parameters) { err in
            if let err = err {
                completion(.failure(err))
            } else {
                guard let data:T = T.self as? T else { return }
                completion(.success(data))
            }
        }
    }
    
    
}
