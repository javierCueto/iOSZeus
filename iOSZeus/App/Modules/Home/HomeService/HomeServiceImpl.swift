//
//  HomeServiceImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

protocol HomeService {
    func loadColor(completion: @escaping (Result<Settings,Error>) -> Void)
    func saveNewColor(with color: String,completion: @escaping (Error?) -> Void)
    func saveDataUser(with name: String, with photoURL: String ,completion: @escaping (Error?) -> Void)
    func saveImageUser(with image: Any ,completion: @escaping (Result<String,Error>) -> Void)
}

struct HomeServiceImpl: HomeService  {
        
    let apiClient: Requester
    let imageCDN: ImageCDN
    
    func loadColor(completion: @escaping (Result<Settings,Error>)  -> Void) {
        let customRequest = CustomRequest(collection: "settings", documento: "theme")
        apiClient.request(customRequest: customRequest, type: SettingsDTO.self) { result in
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
        let customRequest = CustomRequest(collection: "settings", documento: "theme", parameters: parameters)
        apiClient.request(customRequest: customRequest, type: SuccessDTO.self) { result in
            switch result {
            case .success:
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func saveDataUser(with name: String, with photoURL: String, completion: @escaping (Error?) -> Void) {
        let parameters = ["name": name, "photoURL": photoURL]
        let customRequest = CustomRequest(collection: "userData", documento: "currentUser", parameters: parameters)
        apiClient.request(customRequest: customRequest, type: SuccessDTO.self) { result in
            switch result {
            case .success:
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    
    func saveImageUser(with image: Any, completion: @escaping (Result<String, Error>) -> Void) {
        imageCDN.loadImage(image) { result in
            switch result {
            case .success(let imageURL):
                completion(.success(imageURL))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

