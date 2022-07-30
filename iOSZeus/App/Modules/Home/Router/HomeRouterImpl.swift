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
    
    func goToChart(view: HomeViewFromPresenter?, backGroundColor: String?) {
        guard let view = view as? HomeViewController, let nav = view.navigationController else { return }
        let chartInfoModule = ChartInfoModuleFactory()
        chartInfoModule.makeModule(navigationController: nav,  backGroundColor: backGroundColor)
    }
    
    func gotToSeePicture(view: HomeViewFromPresenter?, _ userDataBag: UserDataBag) {
        let seeSelfieModule = SeeSelfieFactoryModule()
        seeSelfieModule.makeModule(view: view, with: userDataBag)
    }
}
