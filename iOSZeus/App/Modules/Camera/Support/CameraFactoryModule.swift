//
//  CameraFactoryModule.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

struct CameraFactoryModule {
    func makeModule(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate) {
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
