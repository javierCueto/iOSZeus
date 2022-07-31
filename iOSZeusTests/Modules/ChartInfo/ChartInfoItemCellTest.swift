//
//  ChartInfoItemCellTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus
@testable import Charts

final class ChartInfoItemCellTest: XCTestCase {
    var sut: ChartInfoItemCell!

    override func setUp() {
        sut = ChartInfoItemCell()
    }

    func test_InitCoder() {
        sut = ChartInfoItemCell(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_CellNumberViews() {
        let num = sut.subviews.count
        XCTAssertEqual(num, 1)
    }
    
    func test_StackViewConfig() {
        let stackView = sut.subviews[0] as! UIStackView
        
        XCTAssertEqual(stackView.subviews.count, 2)
        XCTAssertEqual(stackView.axis, .vertical)
        XCTAssertEqual(stackView.spacing, 20)
    }
    
    func test_ChartViewConfig() {
        let stackView = sut.subviews[0] as! UIStackView
        let chartView = stackView.subviews[1] as! PieChartView
        
        XCTAssertEqual(chartView.legend.form,.circle)
        XCTAssertEqual(chartView.legend.yEntrySpace,15)
        XCTAssertEqual(chartView.legend.formSize,14)
        XCTAssertEqual(chartView.chartDescription?.enabled, false)
        XCTAssertEqual(chartView.drawEntryLabelsEnabled, false)

    }
    
    func test_WhenCell_IsGettingData() {
        sut.configData(with: ChartInfoCellViewModel(reports: [Report(value: "1", quantity: "1")]), backgroundColor: .red)
        let stackView = sut.subviews[0] as! UIStackView
        let chartView = stackView.subviews[1] as! PieChartView
        
        XCTAssertNotNil(chartView.data)
    }
    
    override func tearDown() {

    }
}
