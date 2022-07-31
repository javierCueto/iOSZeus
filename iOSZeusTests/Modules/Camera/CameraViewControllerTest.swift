//
//  CameraViewControllerTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

final class CameraViewControllerTest: XCTestCase {
    
    var sut: CameraViewController!

    override func setUp() {
        sut = CameraViewController()
        sut.loadViewIfNeeded()
    }
    
    func test_WhenCameraIsNotShowing() {
        let parentController = UIViewController()
        let nav = UINavigationController(rootViewController: parentController)
        nav.pushViewController(sut, animated: false)
        
        XCTAssertEqual(nav.viewControllers.count, 2)
    }
    
    func test_WhenCameraIsShowing() {
        sut = CameraViewController()
        sut.pickerController = UIImagePickerController()
        sut.loadViewIfNeeded()

        let parentController = UIViewController()
        let nav = UINavigationController(rootViewController: parentController)
        nav.pushViewController(sut, animated: false)
        
        XCTAssertEqual(nav.viewControllers.count, 2)
    }
    
    func test_WhenCamera_DidFinished() {
        let presenterMock = CameraPresenterMock()
        sut.presenter = presenterMock
        sut.pickerController = UIImagePickerController()
        let picker = sut.pickerController!
        sut.imagePickerController(picker, didFinishPickingMediaWithInfo: [.editedImage : UIImage()])
        
        XCTAssertTrue(presenterMock.imageWasTaken)
    }
    
    func test_WhenCamera_DidFinishedReturn() {
        let presenterMock = CameraPresenterMock()
        sut.presenter = presenterMock
        sut.pickerController = UIImagePickerController()
        let picker = sut.pickerController!
        sut.imagePickerController(picker, didFinishPickingMediaWithInfo: [.imageURL : UIImage()])
        
        XCTAssertFalse(presenterMock.imageWasTaken)
    }
    
    func test_WhenCamera_DidCancel() {
        let presenterMock = CameraPresenterMock()
        sut.presenter = presenterMock
        sut.pickerController = UIImagePickerController()
      
        sut.imagePickerControllerDidCancel(sut.pickerController!)
        
        XCTAssertTrue(presenterMock.cancel)
    }

    override func tearDown() {
        sut = nil
    }
    
    final class CameraPresenterMock: CameraPresenterInputFromView {
        
        var imageWasTaken = false
        var cancel = false
        
        func didImageTaken(image: Any) {
            imageWasTaken = true
        }
        
        func didCancel() {
            cancel = true
        }
        
        
    }

}
