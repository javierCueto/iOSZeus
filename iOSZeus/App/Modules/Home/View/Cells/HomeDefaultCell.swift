//
//  HomeDefaultCell.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

final class HomeDefaultCell: UITableViewCell {
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func configUI(parentView: UIView, customView: UIView){
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        parentView.addSubview(customView)
        customView.anchor(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pTop: GConstants.normalPadding,
            pRight: GConstants.normalPadding,
            pBottom: GConstants.normalPadding,
            pLeft: GConstants.doublePadding)
    }
    
}

extension HomeDefaultCell: Reusable { }
