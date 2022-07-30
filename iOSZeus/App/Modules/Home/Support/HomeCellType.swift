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
    case buttonCell
}

extension HomeCellType: CustomStringConvertible {
    var description: String {
        switch self {
        case .textFieldCell:
            return String()
        case .selfieText:
            return GLocalizable.selfieText
        case .chartText:
            return GLocalizable.chartText
        case .buttonCell:
            return GLocalizable.buttonCell
        }
    }
    
    var isButton: Bool {
        switch self {
        case .textFieldCell:
            return false
        case .selfieText:
            return true
        case .chartText:
           return false
        case .buttonCell:
            return true
        }
    }
}

extension HomeCellType: CaseIterable { }
