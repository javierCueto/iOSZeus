//
//  ChartInfoModuleFactory.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

struct ChartInfoModuleFactory {
    func makeModule(navigationController: UINavigationController) {
        let apiClient = ApiClient()
        let service = ChartInfoServiceImpl(apiClient: apiClient)
        let interactor = ChartInfoInteractorImpl(chartInfoService: service)
        let presenter = ChartInfoPresenterImpl()
        let controller = ChartInfoViewController()
        let router = ChartInfoRouterImpl()
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = controller
        interactor.presenter = presenter
        
        navigationController.pushViewController(controller, animated: true)
    }
}
