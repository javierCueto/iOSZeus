//
//  ChartInfoInteractorMock.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

@testable import iOSZeus

final class ChartInfoInteractorMock: ChartInfoInteractor {
    var presenter: ChartInfoInteractorOutput?
    
    var title: String? = "hi"
    
    var numberOfCharts: Int = 2
    
    func getChartData() {
        
    }
    
    func withSuccess() {
        presenter?.dataFromInteractor(DataChart(reports: [], companies: []))
    }
    
    func withError() {
        presenter?.onError(errorMessage: "hi")
    }
}
