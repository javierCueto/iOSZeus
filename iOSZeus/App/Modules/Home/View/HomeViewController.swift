//
//  HomeViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit
import Combine

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
    
    private var backGroundColor: UIColor?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configUI()
        configTableView()
        addButtonBackGroundColor()
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
        title = presenter?.title
        nameTextField.delegate = self
    }
    
    
    private func addButtonBackGroundColor() {
        let themeColor = UIBarButtonItem(image: UIImage(systemName: "paintbrush"), style: .done, target: self, action: #selector(openPickerColor))
        navigationItem.rightBarButtonItem = themeColor
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
        //cell.backgroundColor = backGroundColor
        return cell
    }
    
    var cancellable: AnyCancellable?
    
    @objc
    private func openPickerColor(){
        let picker = UIColorPickerViewController()
           picker.delegate = self
           
           self.present(picker, animated: true, completion: nil)
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
    func setColor(_ color: String) {
        backGroundColor = hexStringToUIColor(hex: color)
        DispatchQueue.main.async {
            self.view.backgroundColor = self.backGroundColor
        }
    }
    
    func showError(errorMessage: String) {
        presentAlert(alertText: GLocalizable.errorTitle, alertMessage: errorMessage)
    }
}

extension HomeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        presenter?.saveColor(hexStringFromColor(color: color))
        self.view.backgroundColor = color
    }
}







