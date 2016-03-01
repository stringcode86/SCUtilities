//
//  Set+Extensions.swift
//  Pods
//
//  Created by Michal Inger on 29/02/2016.
//
//

import Foundation

/// Set extension
public extension Set {
    /// - Parameter hashValue: hash of element in Set
    /// - Returns: Member where hash value equal to `hashValue`
    public func memberWithHash(hashValue: Int) -> Element? {
        return self.filter { $0.hashValue == hashValue }.first
    }
}