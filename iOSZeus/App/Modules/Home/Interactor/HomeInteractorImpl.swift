//
//  HomeInteractorImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import Foundation

final class HomeInteractorImpl: HomeInteractorInput {
    
    
    
    var title: String?
    var systemColor: String?
    weak var presenter: HomeInteractorOutput?
    
    private let homeService: HomeService
    
    init(homeService: HomeService) {
        self.homeService = homeService
    }
    
    func getColor() {
        homeService.loadColor { result in
            switch result {
                
            case .success(let theme):
                self.systemColor = theme.color
                self.presenter?.updateColor(theme.color)
            case .failure(let error):
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }
        }
    }
    
    func getNumberCells() -> Int {
        HomeCellType.allCases.count
    }
    
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType {
        let homeCellType = HomeCellType(rawValue: indexPath.row) ?? .selfieText
        return homeCellType
    }
    
    func goToModule(indexPath: IndexPath) {
        let homeCellType = HomeCellType(rawValue: indexPath.row) ?? .selfieText
        switch homeCellType {
        case .textFieldCell:
            break
        case .selfieText:
            openCamera()
        case .chartText:
            openChart()
        }
    }
    
    func persistenColor(_ color: String) {
        systemColor = color
        homeService.saveNewColor(with: color) { error in
            if let error = error {
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }
        }
    }
    


    
}

extension HomeInteractorImpl  {
    private func openCamera() {
        #if IOS_SIMULATOR
        presenter?.onError(errorMessage: GLocalizable.needRealDevice)
        #else
        presenter?.goToCameraModule()
        #endif
    }
    
    private func openChart(){
        presenter?.goToChartModule(backgroundColor: systemColor)
    }
}
