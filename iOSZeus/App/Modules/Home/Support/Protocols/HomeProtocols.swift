//
//  HomeProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol HomeViewFromPresenter: AnyObject {
    var presenter: HomePresenter? { get }
    func showErrorMessage(withMessage: String)
}

protocol HomeRouter {
   func goToChart()
}

typealias HomePresenterViewInteractor = HomePresenter & HomeInteractorOutput & HomePresenterToRouter
protocol HomePresenter: AnyObject {
    var view: HomeViewFromPresenter? { get }
    var interactor: HomeInteractorInput? { get }
    var router: HomeRouter? { get }
    
    func viewDidLoad()
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType?
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
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType
}

