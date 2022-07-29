//
//  DataChartDTO+Mapping.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

struct DataChartDTO: Decodable {
    let reporte: [ReporteDTO]
    let empresas: [EmpresaDTO]
}

extension DataChartDTO {
    struct ReporteDTO: Decodable {
        let valor: String
        let cantidad: String
    }
    
    struct EmpresaDTO: Decodable {
        let nombre: String
        let porcentaje: Int
    }
}

extension DataChartDTO {
    func toDomain() -> DataChart {
        return DataChart(
            reports: reporte.map{ Report(value: $0.valor, quantity: $0.cantidad) },
            companies: empresas.map { Company(name: $0.nombre, percentage: $0.porcentaje)}
        )
    }
}
