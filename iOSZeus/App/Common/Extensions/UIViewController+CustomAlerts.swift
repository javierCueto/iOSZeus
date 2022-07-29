//
//  UIViewController+CustomAlerts.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//


import UIKit

extension UIViewController {
    func presentAlert(alertText : String, alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: GLocalizable.accept, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
