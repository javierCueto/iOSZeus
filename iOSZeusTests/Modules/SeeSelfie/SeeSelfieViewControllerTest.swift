//
//  SeeSelfieViewControllerTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

final class SeeSelfieViewControllerTest: XCTestCase {
    
    var sut: SeeSelfieViewController!
    var presenterMock: SeeSelfiePresenterMock!

    override func setUp() {
        presenterMock = SeeSelfiePresenterMock()
        sut = SeeSelfieViewController()
        sut.presenter = presenterMock
        sut.loadViewIfNeeded()
    }
    
    func test_imageConfig(){
        let image = sut.view.subviews[0] as! UIImageView
        
        XCTAssertEqual(image.contentMode, .scaleAspectFit)
    }
    
    func test_imageURlIsLoaded(){
        presenterMock = SeeSelfiePresenterMock()
        sut = SeeSelfieViewController()
        sut.presenter = presenterMock
        presenterMock.loadImage()
        sut.loadViewIfNeeded()

        let image = sut.view.subviews[0] as! UIImageView
        XCTAssertNotNil(image.image)
    }

    override func tearDown() {
        sut = nil
        presenterMock = nil
    }

}
