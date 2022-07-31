//
//  ChartInfoCellViewModelTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

final class ChartInfoCellViewModelTest: XCTestCase {
    
    var sut: ChartInfoCellViewModel!

    override func setUp() {
    }
    
    func test_WhenIsInit_WithReports() {
        sut = ChartInfoCellViewModel(reports: [
            Report(value: "Si", quantity: "70"),
            Report(value: "No", quantity: "30"),
            Report(value: "No", quantity: "P")])
        
        XCTAssertEqual(sut.labels.count, 3)
        XCTAssertEqual(sut.value.count, 3)
        XCTAssertEqual(sut.value[1], 30)
        XCTAssertEqual(sut.labels[0], "Si 70.0 %")
    }
    
    func test_WhenIsInit_WithCompanies() {
        sut = ChartInfoCellViewModel(companies: [
            Company(name: "Pedro", percentage: 20),
            Company(name: "Picapiedra", percentage: 80)])
        
        XCTAssertEqual(sut.labels.count, 2)
        XCTAssertEqual(sut.value.count, 2)
        XCTAssertEqual(sut.value[1], 80)
        XCTAssertEqual(sut.labels[0], "Pedro 20.0 %")
    }

    override func tearDown()  {
        sut = nil
    }

}
