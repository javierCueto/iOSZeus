//
//  HomeCellType.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

enum HomeCellType: Int {
    case textFieldCell
    case selfieText
    case chartText
}

extension HomeCellType: CustomStringConvertible {
    var description: String {
        switch self {
        case .textFieldCell:
            return ""
        case .selfieText:
            return "Take a selfie"
        case .chartText:
           return "Open chart"
        }
    }
}

extension HomeCellType: CaseIterable { }
