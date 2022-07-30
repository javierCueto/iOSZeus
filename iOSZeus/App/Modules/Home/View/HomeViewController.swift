//
//  HomeViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

final class HomeViewController: UITableViewController {
    
    // MARK: - Public properties
    var presenter: HomePresenteInput?
    
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
        guard let homeCellType = presenter?.cellType(cellForRowAt: indexPath) else { return UITableViewCell() }
        
        switch homeCellType {
        case .textFieldCell:
            cell.configUI(parentView: cell.contentView, customView: nameTextField)
        default:
            let selfieLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.text = homeCellType.description
                label.textColor = homeCellType.isButton ? .systemBlue : .label
                label.numberOfLines = Int.zero
                return label
            }()
            
            cell.configUI(parentView: cell, customView: selfieLabel)
        }
        return cell
    }
    
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
    
    func clearField() {
        nameTextField.text = String()
    }
    
    func alertSelfie() {
        let alert = UIAlertController(title: "Options", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "See current selfie", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Retake selfie", style: UIAlertAction.Style.default, handler: { _ in
            self.presenter?.didButtonRetakeWasPressed()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: SpinnerDisplayable {
    func displaySpinner() {
        presentSpinner()
    }
    
    func removeSpinner() {
        hideSpinner()
    }
}

extension HomeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        presenter?.saveColor(hexStringFromColor(color: color))
        self.view.backgroundColor = color
    }
}


extension HomeViewController: UITextFieldDelegate {
    
    //TODO: Move this validation to interactor
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: []) else { return false}
        if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
            
            return false
        }
        return true
    }
    
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        presenter?.saveName(textField.text)
    }
}







