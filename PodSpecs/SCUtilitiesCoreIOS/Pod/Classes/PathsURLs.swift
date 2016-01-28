//
//  File.swift
//  SCUtilities
//
//  Created by Michal Inger on 11/01/2016.
//  Copyright © 2016 stringCode ltd. All rights reserved.
//

import Foundation

public func documentsPath(expandTilde: Bool = true) -> String {
    let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, expandTilde).first
    return path!
}