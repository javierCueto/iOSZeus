//
//  ModulesFactory.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit

protocol AppFactory {
    func makeApp(navigationController: UINavigationController, window: UIWindow?)
}

protocol HomeFactory {
    func makeHomeModule() -> UIViewController
}

protocol SelfieFactory {
    func makeSelfieModule(view: HomeViewFromPresenter?, with userDataBag: UserDataBag)
}

protocol CameraFactory {
    func makeCameraModule(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate)
}

protocol ChartFactory {
    func makeChartModule(navigationController: UINavigationController, backGroundColor: String?)
}

typealias ModulesHomeFactory = SelfieFactory & CameraFactory & ChartFactory
