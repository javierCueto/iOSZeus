//
//  SpinnerDisplayable.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit.UIViewController

protocol SpinnerDisplayable {
    func presentSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self: UIViewController {
    func presentSpinner() {
        guard let nav = navigationController else { return }
        
        let spinnerView = UIView()
        nav.view.addSubview(spinnerView)
        spinnerView.fillSuperView()
        spinnerView.backgroundColor = .systemBackground.withAlphaComponent(GConstants.defaultTransparency)
        spinnerView.tag = GConstants.spinnerTag
        let spinnerIndicator = UIActivityIndicatorView.init(style: .large)
            spinnerIndicator.startAnimating()
            spinnerView.addSubview(spinnerIndicator)
            spinnerIndicator.fillSuperView()
    }
    
    func hideSpinner() {
        guard let nav = navigationController else { return }
        DispatchQueue.main.async {
            let spinnerView = nav.view.viewWithTag(GConstants.spinnerTag)
            UIView.animate(withDuration: GConstants.defaultTimeAnimation) {
                spinnerView?.alpha = CGFloat.zero
            } completion: { _ in
                spinnerView?.removeFromSuperview()
            }
        }
    }
}
