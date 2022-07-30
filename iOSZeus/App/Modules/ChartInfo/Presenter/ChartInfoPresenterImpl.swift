//
//  ChartInfoPresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

final class ChartInfoPresenterImpl: ChartInfoPresenter {
    var cellItems: [ChartInfoCellViewModel] = []
    
    weak var view: ChartInfoViewFromPresenter?
    
    var interactor: ChartInfoInteractor?
    
    var title: String? {
        interactor?.title
    }
    
    var numberOfRowsInSection: Int? {
        interactor?.numberOfCharts
    }
    
    func viewDidLoad() {
        interactor?.getChartData()
    }
    
}

extension ChartInfoPresenterImpl: ChartInfoInteractorOutput {
    func dataFromInteractor(_ dataChart: DataChart) {
        let viewModelCompanies = ChartInfoCellViewModel(companies: dataChart.companies)
        let viewModelReports = ChartInfoCellViewModel(reports: dataChart.reports)
        cellItems = [viewModelReports, viewModelCompanies]
        view?.dataWasLoad()
    }
    
    func onError(errorMessage: String) {
        view?.showError(errorMessage)
    }
}
