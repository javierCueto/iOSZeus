//
//  CameraRouterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

struct CameraRouterImpl: CameraRouter {
    func didCancel(cameraView: CameraViewFromPresenter?) {
        guard let cameraView = cameraView as? CameraViewController else { return }
        let nav = cameraView.navigationController
        nav?.popViewController(animated: false)
    }
}
