//
//  RequestError.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import Foundation

enum RequestError {
    case errorParsing
}

extension RequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .errorParsing:
            return "Error parsing data"
        }
    }
}
