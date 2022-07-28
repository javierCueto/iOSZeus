//
//  CameraFactoryModule.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

struct CameraFactoryModule {
    func makeModule(view: HomeViewFromPresenter?) -> UIViewController {
        guard let view = view as? HomeViewController, let navigation = view.navigationController else { return UIViewController() }
        let interactor = CameraInteractorImpl()
        let presenter = CameraPresenterImpl()
        let router = CameraRouterImpl()
        let controller = CameraViewController()

        
        controller.presenter = presenter
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        navigation.pushViewController(controller, animated: false)
        
        return navigation
    }
}
