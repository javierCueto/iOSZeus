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
        tableView.backgroundColor = hexStringToUIColor(hex: "#d3d3d3")
    }
    
    private func configUI(){
        view.backgroundColor = hexStringToUIColor(hex: "#d3d3d3")
        title = presenter?.title
        nameTextField.delegate = self
    }
    
    
    private func addButtonBackGroundColor() {
        let themeColor = UIBarButtonItem(image: UIImage(systemName: "paintbrush"), style: .done, target: nil, action: nil)
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
    func setColor(_ color: String) {
        //view.backgroundColor = UIColor(
    }
    
    func showError(errorMessage: String) {
        presentAlert(alertText: GLocalizable.errorTitle, alertMessage: errorMessage)
    }
}


    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }




