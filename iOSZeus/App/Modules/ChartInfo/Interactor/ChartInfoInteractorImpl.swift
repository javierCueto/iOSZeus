//
//  ChartInfoInteractorImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

final class ChartInfoInteractorImpl: ChartInfoInteractor {
    var numberOfCharts: Int = 0
    
    weak var presenter: ChartInfoInteractorOutput?
    
    var title: String? = "Supervisión"
    
    private let chartInfoService: ChartInfoService
    
    init(chartInfoService: ChartInfoService){
        self.chartInfoService = chartInfoService
    }

    func getChartData() {
        chartInfoService.getDataChart { [weak self] result in
            switch result {
            case .success(let data):
                self?.numberOfCharts = 2
                self?.sendToPresenter(data)
            case .failure(let error):
                self?.presenter?.onError(errorMessage: error.localizedDescription)
            }
        }
    }
    
}

extension ChartInfoInteractorImpl {
    private func sendToPresenter(_ dataChart: DataChart) {
        presenter?.dataFromInteractor(dataChart)
    }
}
