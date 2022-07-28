//
//  CameraViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

final class CameraViewController: UIViewController {
    // MARK: - Public properties
    var presenter: CameraPresenterInputFromView?
    var pickerController: UIImagePickerController?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showCamera()
    }
    
    // MARK: - Helpers
    private func showCamera() {
        guard let pickerController = pickerController else { return }
        present(pickerController, animated: true)
    }
    
}

extension CameraViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] else { return }
        presenter?.didImageTaken(image: image)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presenter?.didCancel()
    }
    
}

extension CameraViewController: CameraViewFromPresenter {}
