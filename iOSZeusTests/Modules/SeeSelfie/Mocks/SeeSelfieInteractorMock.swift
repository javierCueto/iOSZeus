//
//  SeeSelfieInteractorMock.swift
//  iOSZeusTests
//
//  Created by Javier Cueto on 30/07/22.
//
@testable import iOSZeus
import UIKit

final class SeeSelfieInteractorMock: SeeSelfieInteractorInput {
    var title: String? = "title"
    
    var imageData: Any? = UIImage()
    
    var imageURL: String? = "urlHere"
    
    var backgroundColor: String? = "red"
}
