//
//  Requester.swift
//  iOSZeus
//
//  Created by Javier Cueto on 28/07/22.
//

protocol Requester {
    func request<T: Decodable>(
        customRequest: CustomRequest?,
        type: T.Type,
        completion: @escaping (Result<T,Error>) -> Void)
}
