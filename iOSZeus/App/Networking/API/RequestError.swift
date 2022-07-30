//
//  RequestError.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import Foundation

enum RequestError {
    case errorParsing
    case errorLoadingData
    case noData
}

extension RequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .errorParsing:
            return GLocalizable.errorParsing
        case .errorLoadingData:
            return GLocalizable.errorLoadingData
        case .noData:
            return GLocalizable.noData
        }
    }
}
