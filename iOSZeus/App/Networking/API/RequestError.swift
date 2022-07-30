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
            return "Error parsing data"
        case .errorLoadingData:
            return "Error loading data in the service"
        case .noData:
            return "There is no data saved in service"
        }
    }
}
