//
//  ChartPresenterTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

final class ChartPresenterTest: XCTestCase {
    var sut: ChartInfoPresenterImpl!
    var chartInteractorMock: ChartInfoInteractorMock!

    override func setUp()  {
        sut = ChartInfoPresenterImpl()
        chartInteractorMock = ChartInfoInteractorMock()
        chartInteractorMock.presenter = sut
        sut.interactor = chartInteractorMock
    }
    
    func test_WhenCellItems_IsInit() {
        let num = sut.cellItems.count
        
        XCTAssertEqual(num, 0)
    }
    
    func test_WhenTitle_IsCalled() {
        let title = sut.title
        
        XCTAssertEqual(title, "hi")
    }
    
    func test_WhenNumber_OfRowsInSectionIsCalled() {
        let number = sut.numberOfRowsInSection
        
        XCTAssertEqual(number, 2)
    }
    
    func test_WhenViedDidLoad_SuccessCall() {
        sut.viewDidLoad()
        chartInteractorMock.withSuccess()
        let num = sut.cellItems.count
        XCTAssertEqual(num, 2)
    }
    
    func test_WhenViedDidLoad_ErrorCall() {
        sut.viewDidLoad()
        chartInteractorMock.withError()
        let num = sut.cellItems.count
        XCTAssertEqual(num, 0)
    }

    override func tearDown() {
        sut = nil
        chartInteractorMock = nil
    }


}
