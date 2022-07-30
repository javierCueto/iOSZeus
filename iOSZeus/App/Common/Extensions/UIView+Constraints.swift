//
//  UIView+Constraints.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

extension UIView {
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        pTop: CGFloat = 0,
        pRight: CGFloat = 0,
        pBottom: CGFloat = 0,
        pLeft: CGFloat = 0
    ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
        
    }
    
    func width(size: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
    }
    
    func height(size: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: size).isActive = true
    }
    
    
    func centerY() {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
    }
    
    func centerX() {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
    }
    
    func fillSuperView() {
        guard let superview = self.superview else { return }
        anchor(top: superview.topAnchor, right: superview.rightAnchor, bottom: superview.bottomAnchor, left: superview.leftAnchor)
    }
    
}
