//
//  ChartInfoPresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

final class ChartInfoPresenterImpl: ChartInfoPresenter {
    var router: CharInfoRouter?
    
    var view: ChartInfoViewFromPresenter?
    
    var interactor: ChartInfoInteractor?
    
    var title: String?
    
    func viewDidLoad() {
        interactor?.getChartData()
    }
    
}

extension ChartInfoPresenterImpl: ChartInfoInteractorOutput {
    func dataFromInteractor(_ dataChart: DataChart) {
    }
    
    func onError(errorMessage: String) {
    }
}
