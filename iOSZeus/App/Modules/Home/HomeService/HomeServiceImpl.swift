//
//  HomeServiceImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

protocol HomeService {
    func loadColor(completion: @escaping (Result<Settings,Error>) -> Void)
    func saveNewColor(with color: String,completion: @escaping (Error?) -> Void)
}

struct HomeServiceImpl: HomeService  {

    
    
    let apiClient: Requester
    
    func loadColor(completion: @escaping (Result<Settings,Error>)  -> Void) {
        apiClient.request(parameters: nil, type: SettingsDTO.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func saveNewColor(with color: String,completion: @escaping (Error?) -> Void) {
        let parameters = ["color": color]
        apiClient.request(parameters: parameters, type: SuccessDTO.self) { result in
            switch result {
            case .success:
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}

