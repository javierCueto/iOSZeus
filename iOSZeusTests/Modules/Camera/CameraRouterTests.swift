//
//  CameraRouterTests.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

final class CameraRouterTests: XCTestCase {
    
    var sut: CameraRouterImpl!
    
    override func setUp() {
        sut = CameraRouterImpl()
    }
    
    func test_WhenInsCancel(){
        let parentController = UIViewController()
        let cameraController = CameraViewController()
        let nav = UINavigationController(rootViewController: parentController)
        nav.pushViewController(cameraController, animated: false)
        
        XCTAssertEqual(nav.viewControllers.count, 2)
        sut.didCancel(cameraView: cameraController)
        XCTAssertEqual(nav.viewControllers.count, 1)
    }
    
    
    func test_WhenInsCancel_ReturnGuard(){
        let parentController = UIViewController()
        let cameraController = CameraViewControllerMock()
        let nav = UINavigationController(rootViewController: parentController)
        nav.pushViewController(cameraController, animated: false)
        
        sut.didCancel(cameraView: cameraController)
        
        XCTAssertEqual(nav.viewControllers.count, 2)
    }
    
    override func tearDown() {
        sut = nil
    }
    
}

final class CameraViewControllerMock: UIViewController, CameraViewFromPresenter {
    var presenter: CameraPresenterInputFromView?
}
