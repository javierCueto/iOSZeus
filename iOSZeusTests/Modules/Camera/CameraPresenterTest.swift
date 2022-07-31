//
//  CameraPresenterTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

final class CameraPresenterTest: XCTestCase {
    
    var sut: CameraPresenterImpl!
    var cameraRouterMock: CameraRouterMock!
    var delegateMock: DelegateMock!
    
    override func setUp() {
        sut = CameraPresenterImpl()
        cameraRouterMock = CameraRouterMock()
        delegateMock = DelegateMock()
        sut.router = cameraRouterMock
        sut.delegate = delegateMock
    }
    
    func test_WhenDidCancel_IsCalled(){
        sut.didCancel()
        
        XCTAssertTrue(cameraRouterMock.wasCalled)
    }
    
    func test_WhenImageWasTaken_IsCalled(){
        sut.didImageTaken(image: UIImage())
        
        XCTAssertTrue(delegateMock.wasCalled)
    }
    
    override func tearDown()  {
        sut = nil
        delegateMock = nil
        cameraRouterMock = nil
    }
    
    final class CameraRouterMock: CameraRouter {
        
        var wasCalled = false
        
        func didCancel(cameraView: CameraViewFromPresenter?) {
            wasCalled = true
        }
    }
    
    
    final class DelegateMock: CameraPresenterDelegate {
        var wasCalled = false
        
        func imageTaken(image: Any) {
            wasCalled = true
        }
    }
    
}
