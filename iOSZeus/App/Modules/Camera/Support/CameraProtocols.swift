//
//  CameraProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

protocol CameraViewFromPresenter: AnyObject {
    var presenter: CameraPresenter? { get }
}

protocol CameraRouter {
   func moduleDidFinish()
}

typealias CameraPresenterViewInteractor = CameraPresenter & CameraInteractorOutput & CameraPresenterToRouter
protocol CameraPresenter: AnyObject {
    var view: CameraViewFromPresenter? { get }
    var interactor: CameraInteractorInput? { get }
    var router: CameraRouter? { get }
    
    func viewDidLoad()
}

protocol CameraPresenterToRouter {
    func moduleDidFinish()
}

protocol CameraInteractorOutput: AnyObject {
    func onError(errorMessage: String)

}

protocol CameraInteractorInput: AnyObject {
    var presenter: CameraInteractorOutput? { get }

}

