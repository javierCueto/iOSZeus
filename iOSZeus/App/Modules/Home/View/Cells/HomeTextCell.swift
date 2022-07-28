//
//  HomeTextCell.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

final class HomeTextCell: UITableViewCell {
    // MARK: - Private properties
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .systemGray6
        return textField
    }()
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configUI(){
        contentView.addSubview(nameTextField)
        nameTextField.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor, pTop: 10, pRight: 10, pBottom: 10, pLeft: 20)
        nameTextField.delegate = self
    }
    
}

extension HomeTextCell: Reusable { }
