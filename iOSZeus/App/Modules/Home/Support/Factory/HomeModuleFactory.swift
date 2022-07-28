//
//  HomeModuleFactory.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol HomeModuleFactory {
    func makeModule() -> UIViewController
}

struct HomeModuleFactoryImpl: HomeModuleFactory {
    func makeModule() -> UIViewController {
        let interactor = HomeInteractorImpl()
        let presenter  = HomePresenterImpl()
        let router = HomeRouterImpl()
        let controller = HomeViewController()
        
        interactor.presenter = presenter
        interactor.title = GLocalizable.optionTitle
        presenter.router = router
        presenter.view = controller
        presenter.interactor = interactor
        controller.presenter = presenter
        
        
        return controller
    }
}
