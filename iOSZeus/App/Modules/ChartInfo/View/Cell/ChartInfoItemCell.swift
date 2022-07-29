//
//  ChartInfoItemCell.swift
//  iOSZeus
//
//  Created by Javier Cueto on 29/07/22.
//

import UIKit
import Charts

final class ChartInfoItemCell: UITableViewCell {
    
    // MARK: - Private properties
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .darkGray
        label.text = "hola lmucho"
        return label
    }()
    
    private let chartView = PieChartView()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, chartView])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.91, green: 0.93, blue: 0.98, alpha: 1.00)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configUI() {
        addSubview(containerStackView)
        containerStackView.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor, pRight: 20, pBottom: 40, pLeft: 20)
        configChart()
    }
    
    private func configChart() {
        chartView.holeColor = UIColor(red: 0.91, green: 0.93, blue: 0.98, alpha: 1.00)
        chartView.legend.form = .circle
        chartView.legend.yEntrySpace = 15
        chartView.legend.formSize = 14
        chartView.legend.font = UIFont.systemFont(ofSize: 16)
        chartView.holeRadiusPercent = 0.85
        chartView.transparentCircleRadiusPercent = 0
        chartView.chartDescription?.enabled = false
        chartView.minOffset = 0
        chartView.holeRadiusPercent = 0.9
        chartView.drawEntryLabelsEnabled = false
    }
    
    func configData(with chartInfoCellViewModel: ChartInfoCellViewModel) {
        let label = chartInfoCellViewModel.labels
        let values = chartInfoCellViewModel.value
        var entries: [PieChartDataEntry] = []
        values.enumerated().forEach{ index, item in
            entries.append(PieChartDataEntry(value: item,  label: label[index]))
        }
        configChartDataSet(entries)
    }
    
    private func configChartDataSet(_ entries: [PieChartDataEntry]) {
        let set = PieChartDataSet(entries: entries, label: String())
        set.drawIconsEnabled = false
        set.drawValuesEnabled = false
        set.selectionShift = 0
        set.colors = ChartColorTemplates.joyful()+ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        chartView.data = data
    }
    
}

extension ChartInfoItemCell: Reusable { }
