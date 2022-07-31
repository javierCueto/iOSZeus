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
        label.font = UIFont.systemFont(ofSize: GConstants.titleLabelChart)
        label.textColor = .darkGray
        return label
    }()
    
    private let chartView = PieChartView()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, chartView])
        stackView.axis = .vertical
        stackView.spacing = GConstants.spacingStackViewChart
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Helpers
    
    private func configUI() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(containerStackView)
        containerStackView.anchor(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pRight: GConstants.doublePadding,
            pBottom: GConstants.doublePadding,
            pLeft: GConstants.extraPadding)
        configChart()
    }
    
    private func configChart() {
        chartView.legend.form = .circle
        chartView.legend.yEntrySpace = GConstants.legendYEntrySpace
        chartView.legend.formSize = GConstants.legendFormSize
        chartView.legend.font = UIFont.systemFont(ofSize: GConstants.titleLegendChart)
        chartView.transparentCircleRadiusPercent = CGFloat.zero
        chartView.chartDescription?.enabled = false
        chartView.minOffset = CGFloat.zero
        chartView.holeRadiusPercent = GConstants.holeRadiusPercent
        chartView.drawEntryLabelsEnabled = false
    }
    
    func configData(with chartInfoCellViewModel: ChartInfoCellViewModel, backgroundColor: UIColor ) {
        chartView.holeColor = backgroundColor
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
        set.selectionShift = CGFloat.zero
        set.colors = ChartColorTemplates.joyful()+ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        chartView.data = data
    }
    
}

extension ChartInfoItemCell: Reusable { }
