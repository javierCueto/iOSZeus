//
//  ChartInfoViewControllerTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

final class ChartInfoViewControllerTest: XCTestCase {
    
    var sut: ChartInfoViewController!
    var presenterMock : ChartInfoPresenterMock!
    
    override func setUp() {
        presenterMock = ChartInfoPresenterMock()
        sut = ChartInfoViewController()
        sut.presenter = presenterMock
        presenterMock.view = sut
        sut.loadViewIfNeeded()
    }
    
    func test_IniCoder(){
        sut = ChartInfoViewController(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_HasTitle() {
        let title = sut.title
        
        XCTAssertEqual(title, "hello")
    }
    
    func test_tableConfiguration() {
        let tableView = sut.tableView
        
        XCTAssertEqual(tableView?.rowHeight, 350)
        XCTAssertEqual(tableView?.separatorStyle, UITableViewCell.SeparatorStyle.none)
    }
    
    func test_WhenCellIsCreated_Success() {
        let tableView = sut.tableView
        presenterMock.dataWasLoaded()
        let numItems = tableView?.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numItems, 2)
        
    }
    
    func test_WhenCellIsCreated_Zero() {
        let tableView = sut.tableView
        presenterMock.dataWasLoadedZero()
        let numItems = tableView?.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numItems, 0)
        
    }
    
    func test_ShowAlert() {
        let tableView = sut.tableView
        presenterMock.dataWasLoadedError()
        let numItems = tableView?.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numItems, 0)
        
    }
    
    func test_WhenCellIsCreated_ChartInfoItemCell() {
        presenterMock.dataWasLoaded()
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ChartInfoItemCell
        XCTAssertNotNil(cell)
        
    }
    
    func test_WhenCellIsCreated_UITableViewCell() {
        sut.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "otro")
        presenterMock.dataWasLoaded()
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
    }

    override func tearDown() {
        sut = nil
        presenterMock = nil
    }



}
