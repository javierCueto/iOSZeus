//
//  ImageCDN.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

protocol ImageCDN {
    func loadImage(_ image: Any, completion: @escaping (Result<String,Error>) -> Void )
}
