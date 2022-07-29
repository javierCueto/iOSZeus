//
//  HomeServiceImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

protocol HomeService {
    func loadNewColor(completion: @escaping (Result<Settings,Error>) -> Void)
}

struct HomeServiceImpl: HomeService  {
    
    let apiClient: Requester
    
    func loadNewColor(completion: @escaping (Result<Settings,Error>)  -> Void) {
        apiClient.request(type: SettingsDTO.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

