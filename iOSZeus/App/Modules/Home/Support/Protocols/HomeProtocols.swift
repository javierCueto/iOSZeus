//
//  HomeProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol HomeViewFromPresenter: AnyObject {
    var presenter: HomePresenter? { get }
    func showError(errorMessage: String)
    func setColor(_ color: String)
}

protocol HomeRouter {
    func goToChart(view: HomeViewFromPresenter?, backGroundColor: String?)
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
    func saveColor(_ color: String)
}

protocol HomePresenterToRouter {
   // func didSelectButtonChart()
}

protocol HomeInteractorOutput: AnyObject {
    func goToCameraModule()
    func goToChartModule(backgroundColor: String?)
    func onError(errorMessage: String)
    func updateColor(_ color: String)
}

protocol HomeInteractorInput: AnyObject {
    var presenter: HomeInteractorOutput? { get }
    var title: String? { get }
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType
    func getNumberCells() -> Int
    func goToModule(indexPath: IndexPath)
    func getColor()
    func persistenColor(_ color: String)
}

