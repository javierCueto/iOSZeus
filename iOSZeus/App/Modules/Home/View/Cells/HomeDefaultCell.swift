//
//  HomeDefaultCell.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

final class HomeDefaultCell: UITableViewCell {
    // MARK: - Private properties
    private let selfieLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Take a selfie"
        return label
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
        addSubview(selfieLabel)
        selfieLabel.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor, pTop: 10, pRight: 10, pBottom: 10, pLeft: 20)
    }
}

extension HomeDefaultCell: Reusable { }
