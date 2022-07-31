//
//  ChartInfoServiceTest.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import XCTest
@testable import iOSZeus

final class ChartInfoServiceTest: XCTestCase {
    
    var sut: ChartInfoServiceImpl!
    var apiClient: ApiClient!
    var fakeSession: FakeSession!
    
    override func setUp() {
        fakeSession = FakeSession()
        apiClient = ApiClient(urlSession: fakeSession)
        sut = ChartInfoServiceImpl(apiClient: apiClient)
    }
    
    func test_WhenService_IsSuccess() throws {
        fakeSession.data = try MockJSONData().dataChartDTOData()
        var success = false

        sut.getDataChart { result in
            switch result{
            case .success:
                success = true

            default:
                break
            }
        }

        XCTAssertTrue(success)
    }
    
    func test_WhenService_IsFail() {
        var error = false
        sut.getDataChart { result in
            switch result{
            case .failure:
                error = true
            default:
                break
            }
        }

        XCTAssertTrue(error)
    }
    
    override func tearDown()  {
        sut = nil
        apiClient = nil
        fakeSession = nil
    }
    
    
    
}
