//
//  ChartInfoPresenterMock.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

@testable import iOSZeus

final class ChartInfoPresenterMock: ChartInfoPresenter {
    
    var view: ChartInfoViewFromPresenter?
    
    var interactor: ChartInfoInteractor?
    
    var title: String? = "hello"
    
    var numberOfRowsInSection: Int?
    
    var cellItems: [ChartInfoCellViewModel] = []
    
    func viewDidLoad() {
    
    }
    
    func dataWasLoaded() {
        numberOfRowsInSection = 2
        cellItems = [ChartInfoCellViewModel(reports: []), ChartInfoCellViewModel(reports: [])]
        view?.dataWasLoad()
    }
    
    func dataWasLoadedZero() {
        view?.dataWasLoad()
    }
    
    func dataWasLoadedError() {
        view?.showError("error")
    }
}

