//
//  SeeSelfiePresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import Foundation

final class SeeSelfiePresenterImpl: SeeSelfiePresenterInputFromView {

    
    var interactor: SeeSelfieInteractorInput?
    
    var title: String? {
        interactor?.title
    }
    
    var userImageData: Any? {
        interactor?.imageData
    }
    
    var backgroundColor:  String? {
        interactor?.backgroundColor
    }
    
    var imageURL: String? {
        interactor?.imageURL
    }
    
}
