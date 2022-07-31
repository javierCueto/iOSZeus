//
//  SeeSelfieInteractorTests.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

class SeeSelfieInteractorTests: XCTestCase {

    var sut: SeeSelfieInteractorImpl!

    override func setUp() {
        sut = SeeSelfieInteractorImpl()
        sut.imageData = UIImage()
        sut.title = "hi"
        sut.imageURL = "image"
        sut.backgroundColor = "blue"
    }
    
    func test_whenGettingData() {
        XCTAssertEqual(sut.title, "hi")
        XCTAssertEqual(sut.imageURL, "image")
        XCTAssertEqual(sut.backgroundColor, "blue")
        XCTAssertNotNil(sut.imageData)
    }


    override func tearDown(){
        sut = nil
    }

}
