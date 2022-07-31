//
//  SeeSelfiePresenterTests.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus


final class SeeSelfiePresenterTests: XCTestCase {
    
    var sut: SeeSelfiePresenterImpl!
    var interactorMock: SeeSelfieInteractorInput!

    override func setUp() {
        sut = SeeSelfiePresenterImpl()
        interactorMock = SeeSelfieInteractorMock()
        sut.interactor = interactorMock
    }
    
    func test_whenGettingData() {
        XCTAssertEqual(sut.title, "title")
        XCTAssertEqual(sut.imageURL, "urlHere")
        XCTAssertEqual(sut.backgroundColor, "red")
        XCTAssertNotNil(sut.userImageData)
    }

    override func tearDown(){
        sut = nil
        interactorMock = nil
    }

}
