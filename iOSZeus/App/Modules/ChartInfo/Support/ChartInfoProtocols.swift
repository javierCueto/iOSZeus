//
//  ChartInfoProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

protocol ChartInfoViewFromPresenter: AnyObject {
    var presenter: ChartInfoPresenter? { get }
}

protocol ChartInfoRouter {
    func didFinish()
}


protocol ChartInfoPresenter: AnyObject {
    var view: HomeViewFromPresenter? { get }
    var interactor: HomeInteractorInput? { get }
    var router: HomeRouter? { get }
    var title: String? { get }
    
    func viewDidLoad()
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType?
    func numberCells() -> Int?
    func didSelectRowAt(indexPath: IndexPath)
}

protocol ChartInfoPresenterToRouter {
    func didSelectButtonChart()
}

protocol ChartInfoInteractorOutput: AnyObject {
    func onError(errorMessage: String)

}

protocol ChartInfoInteractorInput: AnyObject {
    var presenter: ChartInfoInteractorOutput? { get }
    var title: String? { get }
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType
    func getNumberCells() -> Int
}


