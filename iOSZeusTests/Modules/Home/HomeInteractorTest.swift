//
//  HomeInteractorTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

final class HomeInteractorTest: XCTestCase {
    
    var sut: HomeInteractorImpl!
    var homeServiceStub: HomeServiceStub!
    var homeInteractorOutputMock: HomeInteractorOutputMock!

    override func setUp() {
        homeServiceStub = HomeServiceStub()
        homeInteractorOutputMock = HomeInteractorOutputMock()
        sut = HomeInteractorImpl(homeService: homeServiceStub)
        sut.presenter = homeInteractorOutputMock
    }
    
    func test_CellType() {
        let cell = sut.cellType(cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell, .textFieldCell)
    }
    
    func test_CellType_SelfieType() {
        let cell = sut.cellType(cellForRowAt: IndexPath(row: 20, section: 0))
        
        XCTAssertEqual(cell, .selfieText)
    }
    
    func test_WhenGoToModules() {
        sut.goToModule(indexPath: IndexPath(row: 0, section: 0))
        sut.goToModule(indexPath: IndexPath(row: 1, section: 0))
        sut.goToModule(indexPath: IndexPath(row: 2, section: 0))
        sut.goToModule(indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssertTrue(homeInteractorOutputMock.showError)
        XCTAssertTrue(homeInteractorOutputMock.goToChart)
    }
    
    func test_WhenUserDataIsSaved_ErrorOnImage() {
        sut.persistenName("name")
        sut.goToModule(indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssertTrue(homeInteractorOutputMock.showError)
    }
    
    func test_WhenUserDataIsSaved_SuccessServiceImage() {
        sut.persistenName("name")
        sut.persistenImage(UIImage())
        sut.goToModule(indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssertEqual(sut.photoURL,"image")
    }
    
    func test_WhenUserDataIsSaved_ErrorServiceImage() {
        homeServiceStub.saveImageSuccess = false
        sut.persistenName("name")
        sut.persistenImage(UIImage())
        sut.goToModule(indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssertNotEqual(sut.photoURL,"image")
        XCTAssertTrue(homeInteractorOutputMock.showError)
    }
    
    func test_WhenUserDataIsSaved_ErrorServiceUserData() {
        homeServiceStub.saveDataSuccess = false
        sut.persistenName("name")
        sut.persistenImage(UIImage())
        sut.goToModule(indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssertEqual(sut.photoURL,"image")
        XCTAssertTrue(homeInteractorOutputMock.showError)
    }
    
    func test_WhenUserDataIsSaved_SuccessServiceUserData() {
        sut.persistenName("name")
        sut.persistenImage(UIImage())
        sut.goToModule(indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssertEqual(sut.photoURL,"image")
        XCTAssertTrue(homeInteractorOutputMock.userDataWasLoaded)
    }

    override func tearDown() {
        sut = nil
        homeServiceStub = nil
        homeInteractorOutputMock = nil
    }

    final class HomeServiceStub: HomeService {
        
        var loadColorSuccess = true
        var saveImageSuccess = true
        var saveDataSuccess = true
        func loadColor(completion: @escaping (Result<Settings, Error>) -> Void) {
            if loadColorSuccess {
                completion(.success(Settings(color: "red")))
            }else {
                completion(.failure(RequestError.noData))
            }
        }
        
        func saveNewColor(with color: String, completion: @escaping (Error?) -> Void) {
            
        }
        
        func saveDataUser(with name: String, with photoURL: String, completion: @escaping (Error?) -> Void) {
            if saveDataSuccess {
                completion(nil)
            }else {
                completion(RequestError.noData)
            }
        }
        
        func saveImageUser(with image: Any, completion: @escaping (Result<String, Error>) -> Void) {
            if saveImageSuccess {
                completion(.success("image"))
            }else {
                completion(.failure(RequestError.noData))
            }
        }
        
        func getImageUser(completion: @escaping (Result<UserData, Error>) -> Void) {
            
        }
        
    }
    
    final class HomeInteractorOutputMock: HomeInteractorOutput {
        var goToCamera = false
        var goAlertSelfie = false
        var goToChart = false
        var showError = false
        var userDataWasLoaded = false
        
        func goToCameraModule() {
            goToCamera =  true
        }
        
        func goToChartModule(backgroundColor: String?) {
            goToChart = true
        }
        
        func onError(errorMessage: String) {
            showError = true
        }
        
        func updateColor(_ color: String) {
            
        }
        
        func userDataLoaded() {
            userDataWasLoaded = true
        }
        
        func showSpinner() {
            
        }
        
        func hideSpinner() {
            
        }
        
        func showAlertSelfie() {
            goAlertSelfie = true
        }
        
        
    }

}
