//
//  HomeRouterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//


struct HomeRouterImpl: HomeRouter {
    var modulesHomeFactory: ModulesHomeFactory
    
    func goToCamera(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate) {
        guard let view = view as? HomeViewController, let nav = view.navigationController else { return }
        modulesHomeFactory.makeCameraModule(navigationController: nav, parentPresenter: parentPresenter)
    }
    
    func goToChart(view: HomeViewFromPresenter?, backGroundColor: String?) {
        guard let view = view as? HomeViewController, let nav = view.navigationController else { return }
        modulesHomeFactory.makeChartModule(navigationController: nav,  backGroundColor: backGroundColor)
    }
    
    func gotToSeePicture(view: HomeViewFromPresenter?, _ userDataBag: UserDataBag) {
        guard let view = view as? HomeViewController, let nav = view.navigationController else { return }
        modulesHomeFactory.makeSelfieModule(navigationController: nav, with: userDataBag)
    }
}
