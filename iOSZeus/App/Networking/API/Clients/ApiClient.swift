//
//  ApiClient.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import Foundation

struct ApiClient: Requester {
    
    private var url: URL?
    private var urlSession: URLSession
    
    //TODO: Model url to another place
    init(urlSession: URLSession = .shared, url: URL? = URL(string: "https://s3.amazonaws.com/dev.structure.files/examen/ios/test.json")){
        self.url = url
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(
        customRequest: CustomRequest?,
        type: T.Type,
        completion: @escaping (Result<T,Error>) -> Void
    ) {
        guard let url = url else { return }
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(Result.failure(error))
            }
 
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                }catch {
                    completion(Result.failure(RequestError.errorParsing))
                }
                
            } else {
                completion(Result.failure(RequestError.noData))
            }
        }.resume()
    }
}

