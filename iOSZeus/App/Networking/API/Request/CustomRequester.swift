//
//  CustomRequester.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

struct CustomRequest {
    let collection: String?
    let document: String?
    let parameters: [String: Any]?
    
    init(collection: String? = nil, documento: String? = nil, parameters: [String: Any]? = nil) {
        self.collection = collection
        self.document = documento
        self.parameters = parameters
    }
}
