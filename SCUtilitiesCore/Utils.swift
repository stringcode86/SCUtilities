//
//  File.swift
//  SCUtilities
//
//  Created by Michal Inger on 18/11/2015.
//  Copyright © 2015 stringCode ltd. All rights reserved.
//

import Foundation

public func dispatch_after(delay:Double, _ closure:(()->())? = nil) {
    if let closure = closure {
        dispatch_after( dispatch_time( DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))),dispatch_get_main_queue(), closure)
    }
}

public func saveFileToDocumentsWithName(name: String, contents: NSData) {
    var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as String!
    path = path + "/" + name
    contents.writeToFile(path, atomically: false)
}

public func testBuildConfiguration() -> String {
    #if RELEASEF
        let text = "Release SC "
    #else
        let text = "Debug SC"
    #endif
    return text
}