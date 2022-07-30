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
        let apiClient = FirestoreClientRequester()
        let imageCDN = FirestoreImageCDN()
        let service = HomeServiceImpl(apiClient: apiClient, imageCDN: imageCDN)
        let interactor = HomeInteractorImpl(homeService: service)
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
