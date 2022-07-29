//
//  HomeProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol HomeViewFromPresenter: AnyObject {
    var presenter: HomePresenter? { get }
}

protocol HomeRouter {
    func goToChart(view: HomeViewFromPresenter?)
    func goToCamera(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate)
}


protocol HomePresenter: AnyObject {
    var view: HomeViewFromPresenter? { get }
    var interactor: HomeInteractorInput? { get }
    var router: HomeRouter? { get }
    var title: String? { get }
    
    func viewDidLoad()
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType?
    func numberCells() -> Int?
    func didSelectRowAt(indexPath: IndexPath)
}

protocol HomePresenterToRouter {
    func didSelectButtonChart()
}

protocol HomeInteractorOutput: AnyObject {
    func onError(errorMessage: String)

}

protocol HomeInteractorInput: AnyObject {
    var presenter: HomeInteractorOutput? { get }
    var title: String? { get }
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType
    func getNumberCells() -> Int
}

