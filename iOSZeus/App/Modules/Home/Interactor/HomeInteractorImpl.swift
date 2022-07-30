//
//  HomeInteractorImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import Foundation
import FirebaseStorage
import UIKit

final class HomeInteractorImpl: HomeInteractorInput {


    var title: String?
    var systemColor: String?
    weak var presenter: HomeInteractorOutput?
    
    private let homeService: HomeService
    
    private var nameField = String()
    private var photoURL = String()
    private var imageData: Any?
    
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
        case .buttonCell:
            if nameField == "" {
                presenter?.onError(errorMessage: GLocalizable.nameRequired)
            }else {
                persistenUserData()
            }
         
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
    

    func persistenName(_ name: String?) {
        nameField = name ?? String()
    }
    
    func persistenImage(_ image: Any) {
        guard let image = image as? UIImage else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
             let filename = NSUUID().uuidString
             
             let ref = Storage.storage().reference(withPath: "/profile_images/\(filename).jpg")
             
             ref.putData(imageData, metadata: nil) { (metadata, error) in
                 if let error = error {
                     return
                 }
                 
                 ref.downloadURL { (url, error) in
                     guard let imageUrl = url?.absoluteString else {return}
                     self.photoURL = imageUrl 
                 }
             }
        
    }
    
    
    private func persistenUserData(){
        homeService.saveDataUser(with: nameField, with: photoURL) { error in
            if let error = error {
                self.presenter?.onError(errorMessage: error.localizedDescription)
            }else{
                self.nameField = ""
                self.presenter?.userDataLoaded()
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
