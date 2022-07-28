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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configTableView()
    }
    
    // MARK: - Helpers
    
    private func configTableView() {
        tableView.register(HomeTextCell.self, forCellReuseIdentifier: HomeTextCell.reusableIdentifier)
        tableView.register(HomeDefaultCell.self, forCellReuseIdentifier: HomeDefaultCell.reusableIdentifier)
    }
    
    private func configUI(){
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Actions
    
    // MARK: - Extension here
    
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCellType = HomeCellType(rawValue: indexPath.row)
        
        switch homeCellType {
        case .textFieldCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTextCell.reusableIdentifier, for: indexPath) as! HomeTextCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeDefaultCell.reusableIdentifier, for: indexPath) as! HomeDefaultCell
            cell.selectionStyle = .none
            return cell
        }
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

