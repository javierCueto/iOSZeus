//
//  HomeRouterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//


struct HomeRouterImpl: HomeRouter {
    
    func goToCamera(view: HomeViewFromPresenter?) {
        let cameraModule = CameraFactoryModule()
        cameraModule.makeModule(view: view)
    }
    
    func goToChart() {

    }
}
