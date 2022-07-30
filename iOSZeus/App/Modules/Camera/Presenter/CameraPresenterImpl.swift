//
//  CameraPresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//


final class CameraPresenterImpl: CameraPresenter {
    weak var view: CameraViewFromPresenter?
    
    weak var delegate: CameraPresenterDelegate?
    
    var router: CameraRouter?
}

extension CameraPresenterImpl: CameraPresenterInputFromView {
    func didCancel() {
        router?.didCancel(cameraView: view)
    }
    
    func didImageTaken(image: Any) {
        delegate?.imageTaken(image: image)
        didCancel()
    }
}
