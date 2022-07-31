//
//  HomeServiceTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

final class HomeServiceTest: XCTestCase {
    
    var sut: HomeServiceImpl!
    var apiClient: ApiClient!
    var fakeSession: FakeSession!
    var imageCDNStub: ImageCDNStub!

    override func setUp() {
        imageCDNStub = ImageCDNStub()
        fakeSession = FakeSession()
        apiClient = ApiClient(urlSession: fakeSession)
        sut = HomeServiceImpl(apiClient: apiClient, imageCDN: imageCDNStub)
    }
    
    func test_WhenColorIsCalled_Success() throws {
        var success = false
        fakeSession.data = try MockJSONData().settingsDTOData()
        
        sut.loadColor { result in
            switch result {
            case .success:
                success = true
            default:
                break
            }
        }
        
        XCTAssertTrue(success)
    }
    
    func test_WhenColorIsCalled_Error() throws {
        var error = false
        fakeSession.data = try MockJSONData().dataChartDTOData()
        
        sut.loadColor { result in
            switch result {
            case .failure:
                error = true
            default:
                break
            }
        }
        
        XCTAssertTrue(error)
    }
    
    func test_WhenColorIsSaved_Success() throws {
        var successResponse = false
        fakeSession.data = try MockJSONData().dataChartDTOData()
        
        sut.saveNewColor(with: "") { error in
            if error == nil {
                successResponse = true
            }
        }
        
        XCTAssertTrue(successResponse)
    }
    
    func test_WhenColorIsSaved_Error() throws {
        var errorResponse = false
        fakeSession.error = RequestError.noData
        
        sut.saveNewColor(with: "") { error in
            if error != nil {
                errorResponse = true
            }
        }
        XCTAssertTrue(errorResponse)
    }
    
    func test_WhenUserDataIsSaved_WithSuccess() throws {
        var successResponse = false
        fakeSession.data = try MockJSONData().dataChartDTOData()
        
        sut.saveDataUser(with: "name", with: "photo") { error in
            if error == nil {
                successResponse = true
            }
        }
        
        XCTAssertTrue(successResponse)
    }
    
    
    func test_WhenUserDataIsSaved_WithError() throws {
        var errorResponse = false
        fakeSession.error = RequestError.noData
        
        sut.saveDataUser(with: "name", with: "photo") { error in
            if error != nil {
                errorResponse = true
            }
        }
        XCTAssertTrue(errorResponse)
    }
    
    func test_WhenImageUserIsSaved_Success() {
        var successResponse = false

        sut.saveImageUser(with: UIImage(), completion: { result in
            switch result {
            case .success:
                successResponse = true
            default:
                break
            }
        })
        
        XCTAssertTrue(successResponse)
    }
    
    func test_WhenImageUserIsSaved_Error() {
        var errorResponse = false
        imageCDNStub.withError()
        sut.saveImageUser(with: UIImage(), completion: { result in
            switch result {
            case .failure:
                errorResponse = true
            default:
                break
            }
        })
        
        XCTAssertTrue(errorResponse)
    }
    
    
    func test_WhenGetImageUserIsCalled_Success() throws {
        var success = false
        fakeSession.data = try MockJSONData().userDataDTOData()
        
        sut.getImageUser { result in
            switch result {
            case .success:
                success = true
            default:
                break
            }
        }
        
        XCTAssertTrue(success)
    }
    
    func test_WhenGetImageUserIsCalled_Error() throws {
        var error = false
        fakeSession.data = try MockJSONData().dataChartDTOData()
        
        sut.getImageUser { result in
            switch result {
            case .failure:
                error = true
            default:
                break
            }
        }
        
        XCTAssertTrue(error)
    }
    

    override func tearDown() {
        sut = nil
        apiClient = nil
        fakeSession = nil
        imageCDNStub = nil
    }
    
    final class ImageCDNStub: ImageCDN {
        
        var completionMock: (Result<String, Error>) = .success("image")
        func loadImage(_ image: Any, completion: @escaping (Result<String, Error>) -> Void) {
            completion(completionMock)
        }
        
        func withError() {
            completionMock = .failure(ErrorImageCDN.imageDoesNotExist)
        }
        
    }


}
