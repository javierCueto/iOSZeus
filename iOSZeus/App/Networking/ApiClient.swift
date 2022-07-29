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
    
    private let decoder: JSONDecoder = {
       let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    
    init(urlSession: URLSession = .shared, url: URL? = URL(string: "https://s3.amazonaws.com/dev.structure.files/examen/ios/test.json")){
        self.url = url
        self.urlSession = urlSession
    }
    

    func request<T: Decodable>(type: T.Type, completion: @escaping (Result<T,Error>) -> Void ) {
        guard let url = url else { return }
        urlSession.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let model = try self.decoder.decode(T.self, from: data)
                    completion(.success(model))
                }catch {
                    completion(Result.failure(RequestError.errorParsing))
                }
                
            } else if let error = error {
                completion(Result.failure(error))
            }
        }.resume()
    }
}

