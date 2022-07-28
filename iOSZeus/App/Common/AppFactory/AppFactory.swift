//
//  AppFactory.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol AppFactory {
    func makeApp(navigationController: UINavigationController, window: UIWindow?)
}

struct AppFactoryImpl: AppFactory {
    func makeApp(navigationController: UINavigationController, window: UIWindow?) {
        let homeModuleFactory = HomeModuleFactoryImpl()
        let controller = homeModuleFactory.makeModule()
        navigationController.setViewControllers([controller], animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
