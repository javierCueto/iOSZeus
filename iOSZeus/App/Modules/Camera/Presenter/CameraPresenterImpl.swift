//
//  CameraPresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//


final class CameraPresenterImpl: CameraPresenter {
    weak var view: CameraViewFromPresenter?
    
    var interactor: CameraInteractorInput?
    
    var router: CameraRouter?
    
    func viewDidLoad() {
        
    }
}

extension CameraPresenterImpl: CameraPresenterToRouter {
    func moduleDidFinish() {
        
    }
}

extension CameraPresenterImpl: CameraInteractorOutput {
    func onError(errorMessage: String) {
    
    }
}
