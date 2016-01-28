//
//  SCCacheManager.swift
//  SCUtilities
//
//  Created by Michal Inger on 13/12/2015.
//  Copyright © 2015 stringCode ltd. All rights reserved.
//

import Foundation

public class SCCacheManager {
    public static let sharedInstance = SCCacheManager()
    public var maxImageCacheCount = 10
    public func cache(item: Any, forKey key: String) {
        while cache.count >= maxImageCacheCount {
            cache.removeFirst()
        }
        cache.append(CacheItem(key: key, cache: item))
    }
    
    public func clearCache()  {
        self.cache = [CacheItem]()
    }
    
    private struct CacheItem {
        let creationDate = NSDate()
        let key: String
        let cache: Any
    }
    
    private var cache = [CacheItem]()
}
