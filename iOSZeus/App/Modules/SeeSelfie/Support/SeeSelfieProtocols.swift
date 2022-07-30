//
//  SeeSelfieProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit

protocol SeeSelfieViewFromPresenter: AnyObject {
    var presenter: SeeSelfiePresenterInputFromView? { get }
}



protocol SeeSelfiePresenterInputFromView: AnyObject {
    var interactor: SeeSelfieInteractorInput? { get }
    var title: String? { get }
    var userImageData: Any? { get }
    var imageURL: String? { get }
    var backgroundColor: String? { get }
    
}

protocol SeeSelfieInteractorInput: AnyObject {
    var title: String? { get }
    var imageData: Any? { get }
    var imageURL: String? { get }
    var backgroundColor: String? { get }
}
