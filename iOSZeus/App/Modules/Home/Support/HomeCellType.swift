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
            return ""
        case .selfieText:
            return "Take a selfie"
        case .chartText:
           return "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
        case .buttonCell:
            return "Save data"
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
