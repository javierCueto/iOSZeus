//
//  UITableViewCell+TextValidation.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: []) else { return false}
        if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
            return false
        }
        return true
    }
}

