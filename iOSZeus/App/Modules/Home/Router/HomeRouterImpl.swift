//
//  HomeRouterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//


struct HomeRouterImpl: HomeRouter {
    var modulesHomeFactory: ModulesHomeFactory
    
    func goToCamera(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate) {
        modulesHomeFactory.makeCameraModule(view: view, parentPresenter: parentPresenter)
    }
    
    func goToChart(view: HomeViewFromPresenter?, backGroundColor: String?) {
        guard let view = view as? HomeViewController, let nav = view.navigationController else { return }
        modulesHomeFactory.makeChartModule(navigationController: nav,  backGroundColor: backGroundColor)
    }
    
    func gotToSeePicture(view: HomeViewFromPresenter?, _ userDataBag: UserDataBag) {
        modulesHomeFactory.makeSelfieModule(view: view, with: userDataBag)
    }
}
