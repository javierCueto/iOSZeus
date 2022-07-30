//
//  FirestoreImageCDN.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit.UIImage
import FirebaseStorage


struct FirestoreImageCDN: ImageCDN {
    
    var storage = Storage.storage()
    
    func loadImage(_ image: Any, completion: @escaping (Result<String,Error>) -> Void ) {
        guard
            let image = image as? UIImage
        else {
            return completion(.failure(ErrorImageCDN.imageDoesNotExist))
        }
        
        guard
            let imageData = image.jpegData(compressionQuality: 0.50)
        else {
            return completion(.failure(ErrorImageCDN.imageReducing))
        }
        loadImageToStorage(imageData, completion: completion)
    }
    
    private func loadImageToStorage(_ imageData: Data, completion: @escaping (Result<String,Error>) -> Void ) {
        let filename = NSUUID().uuidString
        let ref = storage.reference(withPath: "/profile_images/\(filename).jpg")
        ref.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                return completion(.failure(error))
            }
            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else {return}
                completion(.success(imageUrl))
            }
        }
    }
    
}

