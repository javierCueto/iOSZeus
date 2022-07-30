//
//  ChartInfoViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

import UIKit

final class ChartInfoViewController: UITableViewController {
    // MARK: - Public properties
    var presenter: ChartInfoPresenter?
    var backGroundColor: String?
    
    // MARK: - Life Cycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configUI()
        configTableView()
    }
    
    // MARK: - Helpers
    private func configUI() {
        title = presenter?.title
        view.backgroundColor =  hexStringToUIColor(hex: backGroundColor) 
    }
    
    private func configTableView() {
        tableView.register(ChartInfoItemCell.self, forCellReuseIdentifier: ChartInfoItemCell.reusableIdentifier)
        tableView.rowHeight = GConstants.cellSizeChart
        tableView.separatorStyle = .none
    }
    
}

extension ChartInfoViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ChartInfoItemCell.reusableIdentifier, for: indexPath) as? ChartInfoItemCell,
            let viewModel = presenter?.cellItems[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configData(with: viewModel, backgroundColor: hexStringToUIColor(hex: backGroundColor) )
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection ?? Int.zero
    }
}

extension ChartInfoViewController: ChartInfoViewFromPresenter {
    func dataWasLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(_ errorMessage: String) {
        presentAlert(alertText: GLocalizable.errorTitle, alertMessage: errorMessage)
    }
}
