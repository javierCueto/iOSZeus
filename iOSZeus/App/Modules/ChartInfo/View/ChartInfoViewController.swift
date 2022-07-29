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
    // MARK: - Private properties
    
    
    
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
        view.backgroundColor =  UIColor(red: 0.91, green: 0.93, blue: 0.98, alpha: 1.00)
    }
    
    private func configTableView() {
        tableView.register(ChartInfoItemCell.self, forCellReuseIdentifier: ChartInfoItemCell.reusableIdentifier)
        tableView.rowHeight = 350
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
        cell.configData(with: viewModel)
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection ?? Int.zero
    }
    
}

extension ChartInfoViewController: ChartInfoViewFromPresenter {
    func dataWasLoad() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
