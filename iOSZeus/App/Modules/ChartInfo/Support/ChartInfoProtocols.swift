//
//  ChartInfoProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

protocol ChartInfoViewFromPresenter: AnyObject {
    var presenter: ChartInfoPresenter? { get }
    func dataWasLoad()
    func showError(_ errorMessage: String)
}

protocol ChartInfoPresenter: AnyObject {
    var view: ChartInfoViewFromPresenter? { get }
    var interactor: ChartInfoInteractor? { get }
    var title: String? { get }
    var numberOfRowsInSection: Int? { get }
    var cellItems: [ChartInfoCellViewModel] { get }
    func viewDidLoad()
}

protocol ChartInfoInteractorOutput: AnyObject {
    func dataFromInteractor(_ dataChart: DataChart)
    func onError(errorMessage: String)

}

protocol ChartInfoInteractor: AnyObject {
    var presenter: ChartInfoInteractorOutput? { get }
    var title: String? { get }
    var numberOfCharts: Int { get }
    func getChartData()
}


