//
//  UserDataDTO.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

struct UserDataDTO: Decodable {
    let name: String
    let photoURL: String
}

extension UserDataDTO {
    func toDomain() -> UserData {
        return .init(name: name, photoURL: photoURL)
    }
}
