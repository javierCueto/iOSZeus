//
//  ModulesFactoryImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit

struct ModulesFactoryImpl { }

extension ModulesFactoryImpl: HomeFactory {
    func makeHomeModule() -> UIViewController {
        let apiClient = FirestoreClientRequester()
        let imageCDN = FirestoreImageCDN()
        let service = HomeServiceImpl(apiClient: apiClient, imageCDN: imageCDN)
        let interactor = HomeInteractorImpl(homeService: service)
        let presenter  = HomePresenterImpl()
        let router = HomeRouterImpl(modulesHomeFactory: self)
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
extension ModulesFactoryImpl: SelfieFactory {
    
    func makeSelfieModule(view: HomeViewFromPresenter?, with userDataBag: UserDataBag) {
        guard let view = view as? HomeViewController, let navigation = view.navigationController else { return }
        let presenter = SeeSelfiePresenterImpl()
        let interactor = SeeSelfieInteractorImpl()
        let controller = SeeSelfieViewController()
        interactor.title = userDataBag.name
        interactor.imageData = userDataBag.image
        interactor.backgroundColor = userDataBag.systemColor
        interactor.imageURL = userDataBag.photoUrl
        presenter.interactor = interactor
        controller.presenter = presenter
        navigation.pushViewController(controller, animated: true)
    }
}
extension ModulesFactoryImpl: ChartFactory {
    func makeChartModule(navigationController: UINavigationController, backGroundColor: String?) {
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
        controller.backGroundColor = backGroundColor
        
        navigationController.pushViewController(controller, animated: true)
    }

}
extension ModulesFactoryImpl: CameraFactory {
    func makeCameraModule(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate) {
        guard let view = view as? HomeViewController, let navigation = view.navigationController else { return }
        let presenter = CameraPresenterImpl()
        let router = CameraRouterImpl()
        let controller = CameraViewController()
        
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        pickerController.allowsEditing = true
        pickerController.delegate = controller

        controller.presenter = presenter
        controller.pickerController = pickerController
        presenter.view = controller
        presenter.router = router
        presenter.delegate = parentPresenter
        navigation.navigationBar.isHidden = true
        navigation.pushViewController(controller, animated: false)
        
    }
}

extension ModulesFactoryImpl: AppFactory {
    func makeApp(navigationController: UINavigationController, window: UIWindow?) {
        let homeModuleFactory = ModulesFactoryImpl()
        let controller = homeModuleFactory.makeHomeModule()
        navigationController.setViewControllers([controller], animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}


