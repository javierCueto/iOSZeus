//
//  SeeSelfiePresenterMock.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//

@testable import iOSZeus
import UIKit

final class SeeSelfiePresenterMock: SeeSelfiePresenterInputFromView {
    var interactor: SeeSelfieInteractorInput?
    
    var title: String? = "hi"
    
    var userImageData: Any? = UIImage()
    
    var imageURL: String? = "imageUrl"
    
    var backgroundColor: String? = "red"
    
    func loadImage() {
        imageURL = "https://www.google.com/"
        userImageData = nil
    }
    


}
