//
//  ChartInfoCellViewModel.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

import Charts

struct ChartInfoCellViewModel {
    var labels: [String]
    var value: [Double]
}

extension ChartInfoCellViewModel{
    init(reports: [Report]) {
        value = reports.map { Double($0.quantity) ?? Double.zero }
        labels = reports.map { $0.value }
        addPercentage()
    }
    
    init(companies: [Company]) {
        value = companies.map { Double($0.percentage) }
        labels = companies.map { $0.name }
        addPercentage()
    }
    
    private mutating func addPercentage() {
        labels.enumerated().forEach({ index, value in
            self.labels[index] = "\(value) \(self.value[index]) %"
        })
    }
}
