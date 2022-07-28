//
//  HomeViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Public properties
    var presenter: HomePresenter?
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    // MARK: - Helpers
    
    // MARK: - Actions
    
    // MARK: - Extension here

}

extension HomeViewController: HomeViewFromPresenter {
    
    func showErrorMessage(withMessage: String) {

    }
    
    func showSpinner() {

    }
    
    func hideSpinner() {
    }
    
    
}

