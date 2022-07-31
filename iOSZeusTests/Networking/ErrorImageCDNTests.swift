//
//  ErrorImageCDNTests.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 31/07/22.
//

import XCTest
@testable import iOSZeus

class ErrorImageCDNTests: XCTestCase {
    
    func test_GettingData() {
        XCTAssertEqual(ErrorImageCDN.imageDoesNotExist.localizedDescription, GLocalizable.imageDoesNotExist)
        XCTAssertEqual(ErrorImageCDN.imageReducing.localizedDescription, GLocalizable.imageReducing)
    }
    
}


