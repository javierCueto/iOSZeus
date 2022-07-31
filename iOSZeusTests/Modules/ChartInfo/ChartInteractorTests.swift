//
//  ChartInteractorTests.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

final class ChartInteractorTests: XCTestCase {
    
    var sut: ChartInfoInteractorImpl!
    var chartInfoServiceStub: ChartInfoServiceStub!

    override func setUp() {
        chartInfoServiceStub = ChartInfoServiceStub()
        sut = ChartInfoInteractorImpl(chartInfoService: chartInfoServiceStub)
    }
    
    func testInitNumberOfChart() {
        let numberOfCharts = sut.numberOfCharts
        XCTAssertEqual(numberOfCharts, 0)
    }
    
    func test_WhenGetChartDataIsCalled_Success() {
        chartInfoServiceStub.withSuccess()
        
        sut.getChartData()
        
        let numberOfCharts = sut.numberOfCharts
        
        XCTAssertEqual(numberOfCharts, 2)
    }
    
    func test_WhenGetChartDataIsCalled_Fail() {
        chartInfoServiceStub.withError()
        
        sut.getChartData()
        
        let numberOfCharts = sut.numberOfCharts
        
        XCTAssertEqual(numberOfCharts, 0)
    }

    override func tearDown()  {

    }

}
