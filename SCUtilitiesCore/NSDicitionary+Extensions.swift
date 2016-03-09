//
//  NSDicitionary+Extensions.swift
//  SCUtilities
//
//  Created by Michal Inger on 12/01/2016.
//  Copyright © 2016 stringCode ltd. All rights reserved.
//

import Foundation

public extension NSDictionary {
    
    public func swiftStringKeyedDictionary() -> [String: Any] {
        var dict = [String : Any]()
        for (key, value) in self {
            if let key = key as? String {
                dict[key] = value
            }
        }
        return dict
    }
    
    public func stringValue(forKey: String) -> String? {
        return self[forKey] as? String
    }
}