//
//  File.swift
//  SCUtilities
//
//  Created by Michal Inger on 11/01/2016.
//  Copyright © 2016 stringCode ltd. All rights reserved.
//

import Foundation

public func documentsPath(_ expandTilde: Bool = true) -> String {
    return NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                               .userDomainMask,
                                               expandTilde).first!
}

public func libraryPath(_ expandTilde: Bool = true) -> String {
    return NSSearchPathForDirectoriesInDomains(.libraryDirectory,
                                               .userDomainMask,
                                               expandTilde).first!
}
