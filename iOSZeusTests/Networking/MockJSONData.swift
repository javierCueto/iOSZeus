//
//  MockJSONData.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

import Foundation
@testable import iOSZeus

class MockJSONData {
    
    func dataChartDTOData() throws -> Data {
        guard let path = Bundle(for: type(of: self)).path(forResource: "DataChartDTO", ofType: "json") else { fatalError("Couldn't find DataChartDTO.json file") }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }

}
