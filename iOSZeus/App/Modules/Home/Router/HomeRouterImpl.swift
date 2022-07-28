//
//  HomeRouterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//


struct HomeRouterImpl: HomeRouter {
    func goToCamera(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate) {
        let cameraModule = CameraFactoryModule()
        cameraModule.makeModule(view: view, parentPresenter: parentPresenter)
    }
    
    func goToChart() {

    }
}
