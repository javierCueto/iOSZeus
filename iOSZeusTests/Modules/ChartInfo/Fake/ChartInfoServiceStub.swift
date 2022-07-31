//
//  ChartInfoServiceStub.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

@testable import iOSZeus

class ChartInfoServiceStub: ChartInfoService {
    
    var completionFake: (Result<DataChart, Error>)?
    
    
    func getDataChart(completion: @escaping (Result<DataChart, Error>) -> Void) {
        completion(completionFake!)
    }
    
    func withError(){
        completionFake = Result.failure(RequestError.noData)
    }
    
    func withSuccess(){
        completionFake = Result.success(DataChart(reports: [], companies: []))
    }
}
