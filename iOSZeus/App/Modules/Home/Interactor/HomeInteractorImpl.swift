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
    private var name = String()
    private var nameFromField = String()
    private var photoURL = String()
    private var imageData: Any?
    
    init(homeService: HomeService) {
        self.homeService = homeService
    }
    
    func getDataUser() {
        presenter?.showSpinner()
        getColor()
        getImageUser()
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
        case .buttonCell:
            if nameFromField == "" {
                presenter?.onError(errorMessage: GLocalizable.nameRequired)
            }else {
                persistenUserData()
            }
        }
    }
    
    func persistenColor(_ color: String) {
        systemColor = color
        presenter?.showSpinner()
        homeService.saveNewColor(with: color) { error in
            self.presenter?.hideSpinner()
            if let error = error {
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }
        }
    }
    
    func persistenName(_ name: String?) {
        nameFromField = name ?? String()
    }
    
    func persistenImage(_ image: Any){
        imageData = image
    }
    
    func userDataBag() -> UserDataBag {
        UserDataBag(name: name, image: imageData, photoUrl: photoURL, systemColor: systemColor)
    }
    
    private func persistenUserData(){
        guard
            let imageData = imageData else
        {
            presenter?.onError(errorMessage: GLocalizable.imageRequired)
            return
        }
        presenter?.showSpinner()
        homeService.saveImageUser(with: imageData) { result in
            switch result {
            case .success(let photoURL):
                self.photoURL = photoURL
                self.saveDataUser()
            case .failure(let error):
                self.presenter?.hideSpinner()
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }
        }
        
    }
    
    private func saveDataUser() {
        homeService.saveDataUser(with: nameFromField, with: photoURL) { error in
            self.presenter?.hideSpinner()
            self.name = self.nameFromField
            self.nameFromField = String()
            if let error = error {
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }else{
                self.presenter?.userDataLoaded()
            }
        }
    }
    
    private func getImageUser() {
        homeService.getImageUser { result in
            self.presenter?.hideSpinner()
            switch result {
            case .success(let data):
                self.photoURL = data.photoURL
                self.name = data.name
            case .failure(let error):
                guard let error = error as? RequestError, error != RequestError.noData else { return }
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }
        }
    }
    
    private func getColor() {
        homeService.loadColor { result in
            switch result {
            case .success(let theme):
                self.systemColor = theme.color
                self.presenter?.updateColor(theme.color)
            case .failure(let error):
                guard let error = error as? RequestError, error != RequestError.noData else { return }
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
        if  photoURL != String() || imageData != nil {
            presenter?.showAlertSelfie()
        } else{
            presenter?.goToCameraModule()
        }
        #endif
    }
    
    private func openChart(){
        presenter?.goToChartModule(backgroundColor: systemColor)
    }
}
