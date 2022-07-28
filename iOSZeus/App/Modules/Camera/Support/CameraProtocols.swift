//
//  CameraProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

protocol CameraViewFromPresenter: AnyObject {
    var presenter: CameraPresenterInputFromView? { get }
}

protocol CameraRouter {
    func didCancel(cameraView: CameraViewFromPresenter?)
}

protocol CameraPresenter: AnyObject {
    var view: CameraViewFromPresenter? { get }
    var router: CameraRouter? { get }
}

protocol CameraPresenterInputFromView: AnyObject {
    func didImageTaken(image: Any)
    func didCancel()
}

protocol CameraPresenterDelegate: AnyObject {
    func imageTaken(image: Any)
}

