//
//  File.swift
//  SCUtilities
//
//  Created by Michal Inger on 18/11/2015.
//  Copyright © 2015 stringCode ltd. All rights reserved.
//

import Foundation


/// Write `contents` to docoments folder with file `name`
public func saveFileToDocuments(name: String, contents: Data?) {
    guard var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
        return
    }
    path = path + "/" + name
    try? contents?.write(to: URL(fileURLWithPath: path))
}

public func testBuildConfiguration() -> String {
    #if RELEASEF
        let text = "Release SC "
    #else
        let text = "Debug SC"
    #endif
    return text
}
