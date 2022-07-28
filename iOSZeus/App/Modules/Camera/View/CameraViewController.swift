//
//  CameraViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

final class CameraViewController: UIViewController {
    
    var presenter: CameraPresenter?
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        showCamera()
    }
    
    // MARK: - Helpers
    
    private func showCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    // MARK: - Actions
    
    // MARK: - Extension here

}

extension CameraViewController: CameraViewFromPresenter {
    
}



extension CameraViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        navigationController?.popViewController(animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        navigationController?.popViewController(animated: false)
    }
    
}
