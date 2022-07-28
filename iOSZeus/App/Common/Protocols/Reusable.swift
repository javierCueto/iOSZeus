//
//  Reusable.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

protocol Reusable {
    static var reusableIdentifier: String { get }
}

extension Reusable {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
