//
//  HomeViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

final class HomeViewController: UITableViewController {
    
    // MARK: - Public properties
    var presenter: HomePresenter?
    
    // MARK: - Private properties
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configTableView()
    }
    
    // MARK: - Helpers
    
    private func configTableView() {
        tableView.register(HomeDefaultCell.self, forCellReuseIdentifier: HomeDefaultCell.reusableIdentifier)
    }
    
    private func configUI(){
        view.backgroundColor = .systemBackground
        nameTextField.delegate = self
    }
    
    private func configCell(with cell: HomeDefaultCell, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let homeCellType = presenter?.cellType(cellForRowAt: indexPath)
        
        switch homeCellType {
        case .textFieldCell:
            cell.configUI(view: nameTextField)
        default:
            let selfieLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.text = homeCellType?.description
                return label
            }()
            cell.configUI(view: selfieLabel)
        }
        return cell
    }
    
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeDefaultCell.reusableIdentifier, for: indexPath) as? HomeDefaultCell
        else {
            return UITableViewCell()
        }
        return configCell(with: cell, cellForRowAt: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath: indexPath)
    }
    
    
}


extension HomeViewController: HomeViewFromPresenter {
    
    func showErrorMessage(withMessage: String) {
        
    }
    
    func showSpinner() {
        
    }
    
    func hideSpinner() {
    }
    
    
}

