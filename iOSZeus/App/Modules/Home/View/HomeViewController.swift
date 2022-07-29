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
        textField.layer.cornerRadius = GConstants.defaultCornerRadius
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Helpers
    private func configTableView() {
        tableView.register(HomeDefaultCell.self, forCellReuseIdentifier: HomeDefaultCell.reusableIdentifier)
    }
    
    private func configUI(){
        view.backgroundColor = .systemBackground
        title = presenter?.title
        nameTextField.delegate = self
    }
    
    private func configCell(with cell: HomeDefaultCell, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let homeCellType = presenter?.cellType(cellForRowAt: indexPath)
        
        switch homeCellType {
        case .textFieldCell:
            cell.configUI(parentView: cell.contentView, customView: nameTextField)
        default:
            let selfieLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.text = homeCellType?.description
                label.numberOfLines = Int.zero
                return label
            }()
            cell.configUI(parentView: cell, customView: selfieLabel)
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
        presenter?.numberCells() ?? Int.zero
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let homeCellType = presenter?.cellType(cellForRowAt: indexPath)
        switch homeCellType {
        case .textFieldCell:
            return GConstants.defaultHeightCell
        default:
            return UITableView.automaticDimension
        }

    }
    
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath: indexPath)
        view.endEditing(true)
    }
}


extension HomeViewController: HomeViewFromPresenter {
    func showError(errorMessage: String) {
        presentAlert(alertText: GLocalizable.errorTitle, alertMessage: errorMessage)
    }
}






