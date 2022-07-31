//
//  HomeRouterTests.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

final class HomeRouterTests: XCTestCase {
    
    var sut: HomeRouterImpl!
    var modulesFactoryMock: ModulesFactoryMock!
    
    override func setUp() {
        modulesFactoryMock = ModulesFactoryMock()
        sut = HomeRouterImpl(modulesHomeFactory: modulesFactoryMock)

    }

    func test_WhenModule_CameraIsCall() {
        let homeViewController = HomeViewController()
        let nav = UINavigationController(rootViewController: UIViewController())
        nav.pushViewController(homeViewController, animated: false)
        let cameraPresenterDelegateMock = CameraPresenterDelegateMock()
        sut.goToCamera(view: homeViewController, parentPresenter: cameraPresenterDelegateMock)
        
        XCTAssertTrue(modulesFactoryMock.cameraModule)
    }
    
    func test_WhenModule_CameraIsCallReturn() {
        let homeViewController = HomeViewController()
        let cameraPresenterDelegateMock = CameraPresenterDelegateMock()
        sut.goToCamera(view: homeViewController, parentPresenter: cameraPresenterDelegateMock)
        
        XCTAssertFalse(modulesFactoryMock.cameraModule)
    }
    
    func test_WhenModule_CharIsCall() {
        let homeViewController = HomeViewController()
        let nav = UINavigationController(rootViewController: UIViewController())
        nav.pushViewController(homeViewController, animated: false)
        sut.goToChart(view: homeViewController, backGroundColor: nil)
        
        XCTAssertTrue(modulesFactoryMock.chartModule)
    }
    
    func test_WhenModule_CharIsCallReturn() {
        let homeViewController = HomeViewController()
        sut.goToChart(view: homeViewController, backGroundColor: nil)
        
        XCTAssertFalse(modulesFactoryMock.chartModule)
    }
    
    func test_WhenModule_SeePictureIsCall() {
        let homeViewController = HomeViewController()
        let nav = UINavigationController(rootViewController: UIViewController())
        nav.pushViewController(homeViewController, animated: false)
        sut.gotToSeePicture(view: homeViewController, UserDataBag(name: "", image: nil, photoUrl: "", systemColor: nil))
        
        XCTAssertTrue(modulesFactoryMock.seePictureModule)
    }
    
    func test_WhenModule_SeePictureIsCallReturn() {
        let homeViewController = HomeViewController()
        sut.gotToSeePicture(view: homeViewController, UserDataBag(name: "", image: nil, photoUrl: "", systemColor: nil))
        
        XCTAssertFalse(modulesFactoryMock.seePictureModule)
    }
    
    override func tearDown() {
        sut = nil
        modulesFactoryMock = nil
    }
    
    final class CameraPresenterDelegateMock : CameraPresenterDelegate {
        func imageTaken(image: Any) {
            
        }
    }
    
    final class ModulesFactoryMock: ModulesHomeFactory{
        
        var cameraModule = false
        var chartModule = false
        var seePictureModule = false
        
        func makeCameraModule(navigationController: UINavigationController, parentPresenter: CameraPresenterDelegate) {
            cameraModule = true
        }
        
        func makeChartModule(navigationController: UINavigationController, backGroundColor: String?) {
            chartModule = true
        }
        
        func makeSelfieModule(navigationController: UINavigationController, with userDataBag: UserDataBag) {
            seePictureModule = true
        }
        
    }

}
