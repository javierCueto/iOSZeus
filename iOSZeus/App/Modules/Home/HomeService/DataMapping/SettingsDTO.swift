//
//  SettingsDTO.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

struct SettingsDTO: Decodable {
    let color: String
}

extension SettingsDTO {
    func toDomain() -> Settings {
        return .init(color: color)
    }
}
