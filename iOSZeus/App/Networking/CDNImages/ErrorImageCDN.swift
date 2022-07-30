//
//  ImageCDNError.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import Foundation

enum ErrorImageCDN {
    case imageDoesNotExist
    case imageReducing
}

extension ErrorImageCDN: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .imageDoesNotExist:
            return GLocalizable.imageDoesNotExist
        case .imageReducing:
            return GLocalizable.imageReducing
        }
    }
}

