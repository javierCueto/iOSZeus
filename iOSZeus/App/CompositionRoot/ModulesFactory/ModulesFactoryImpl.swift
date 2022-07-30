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
    
    func makeSelfieModule(navigationController: UINavigationController, with userDataBag: UserDataBag) {
        let presenter = SeeSelfiePresenterImpl()
        let interactor = SeeSelfieInteractorImpl()
        let controller = SeeSelfieViewController()
        interactor.title = userDataBag.name
        interactor.imageData = userDataBag.image
        interactor.backgroundColor = userDataBag.systemColor
        interactor.imageURL = userDataBag.photoUrl
        presenter.interactor = interactor
        controller.presenter = presenter
        navigationController.pushViewController(controller, animated: true)
    }
}
extension ModulesFactoryImpl: ChartFactory {
    func makeChartModule(navigationController: UINavigationController, backGroundColor: String?) {
        let apiClient = ApiClient()
        let service = ChartInfoServiceImpl(apiClient: apiClient)
        let interactor = ChartInfoInteractorImpl(chartInfoService: service)
        let presenter = ChartInfoPresenterImpl()
        let controller = ChartInfoViewController()
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.view = controller
        interactor.presenter = presenter
        interactor.title = GLocalizable.supervision
        controller.backGroundColor = backGroundColor
        
        navigationController.pushViewController(controller, animated: true)
    }

}
extension ModulesFactoryImpl: CameraFactory {
    func makeCameraModule(navigationController: UINavigationController, parentPresenter: CameraPresenterDelegate) {
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
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(controller, animated: false)
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


