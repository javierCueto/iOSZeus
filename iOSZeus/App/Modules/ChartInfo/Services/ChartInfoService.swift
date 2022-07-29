//
//  ChartInfoService.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

protocol ChartInfoService {
    func getDataChart(completion: @escaping (Result<DataChart,Error>) -> Void)
}

struct ChartInfoServiceImpl: ChartInfoService  {
    let apiClient: Requester
    
    func getDataChart(completion: @escaping (Result<DataChart, Error>) -> Void) {
        apiClient.request(type: DataChartDTO.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
