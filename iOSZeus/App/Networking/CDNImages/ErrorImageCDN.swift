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
            return "There is no image to load"
        case .imageReducing:
            return "Error compressing image"
        }
    }
}

