//
//  ChartInfoPresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

final class ChartInfoPresenterImpl: ChartInfoPresenter {
    var router: CharInfoRouter?
    
    weak var view: ChartInfoViewFromPresenter?
    
    var interactor: ChartInfoInteractor?
    
    var title: String?
    
    func viewDidLoad() {
        interactor?.getChartData()
    }
    
}

extension ChartInfoPresenterImpl: ChartInfoInteractorOutput {
    func dataFromInteractor(_ dataChart: DataChart) {
        print(dataChart)
    }
    
    func onError(errorMessage: String) {
    }
}
