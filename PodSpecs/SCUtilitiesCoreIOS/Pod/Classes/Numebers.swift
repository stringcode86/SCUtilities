//
//  Numebers.swift
//  SCUtilities
//
//  Created by Michal Inger on 08/01/2016.
//  Copyright © 2016 stringCode ltd. All rights reserved.
//

import Foundation

public extension Double {
    // Rounds the double to decimal places value
    public func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}

public extension Float {
    // Rounds the double to decimal places value
    public func roundToPlaces(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return round(self * divisor) / divisor
    }
}