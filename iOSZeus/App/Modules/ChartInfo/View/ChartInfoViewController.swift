//
//  ChartInfoViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

final class ChartInfoViewController: UIViewController {
    // MARK: - Public properties
    var presenter: ChartInfoPresenter?
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Helpers
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    // MARK: - Actions
    
    // MARK: - Extension here

}

extension ChartInfoViewController: ChartInfoViewFromPresenter { }
