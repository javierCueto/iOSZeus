//
//  HomeModuleFactory.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol HomeModuleFactory {
    func makeModule() -> UIViewController
}

struct HomeModuleFactoryImpl: HomeModuleFactory {
    func makeModule() -> UIViewController {
        return HomeViewController()
    }
}
