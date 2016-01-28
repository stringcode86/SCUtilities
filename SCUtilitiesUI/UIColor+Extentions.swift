//
//  UIColorExtentions.swift
//  Brady's Videos
//
//  Created by Michal Inger on 25/08/2014.
//  Copyright (c) 2014 StringCode Ltd. All rights reserved.
//

#if os(watchOS)
    import WatchKit
#elseif os(OSX)
    import Cocoa
#else
    import UIKit
#endif

// Provide a private typealias for a platform specific color.
#if os(iOS) || os(watchOS) || os(tvOS)
    
    private typealias SCColor = UIColor
    
    public extension UIColor {
        
        public class func randomColor(randomizeAlpha: Bool = false) -> UIColor {
            return SCColor._randomColor(randomizeAlpha) as UIColor
        }
    }

    public extension UIColor {
        
        public convenience init(hexString:String) {
            let rgbVals = SCColor.colorsValuesFromHex(hexString)
            self.init(red:rgbVals.r, green:rgbVals.g, blue:rgbVals.b, alpha:1)
        }
        
        public func toHexString() -> String {
            return (self as SCColor)._toHexString()
        }
    }
    
#elseif os(OSX)
    
    private typealias SCColor = NSColor
    
    public extension NSColor {
        
        public class func randomColor(randomizeAlpha: Bool = false) -> NSColor {
            return SCColor._randomColor(randomizeAlpha) as NSColor
        }
    }
    
    public extension NSColor {
        
        public convenience init(hexString:String) {
            let rgbVals = SCColor.colorsValuesFromHex(hexString)
            self.init(red:rgbVals.r, green:rgbVals.g, blue:rgbVals.b, alpha:1)
        }
        
        public func toHexString() -> String {
            return (self as SCColor)._toHexString()
        }
    }
#endif


private extension SCColor {
    
    private class func _randomColor(randomizeAlpha: Bool = false) -> SCColor {
        let red = randomCGFloatForColor()
        let green = randomCGFloatForColor()
        let blue = randomCGFloatForColor()
        let alpha = (randomizeAlpha) ? max(randomCGFloatForColor(), 0.7) : 1.0
        return SCColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private class func randomCGFloatForColor() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255.0
    }

}

private extension SCColor {
        private class func colorsValuesFromHex(hexString: String) -> (r:CGFloat, g:CGFloat, b:CGFloat) {
        let hexString:String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let scanner            = NSScanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let compMaxVal: CGFloat = 255
        return (CGFloat(r) / compMaxVal, CGFloat(g) / compMaxVal, CGFloat(b) / compMaxVal)
    }
    
    private func _toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

//    public class func averageColor(color: UIColor, withColor otherColor:UIColor) -> UIColor {
//        var rA:CGFloat = 0
//        var gA:CGFloat = 0
//        var bA:CGFloat = 0
//        var aA:CGFloat = 0
//        color.getRed(&rA, green: &gA, blue: &bA, alpha: &aA)
//
//        var rB:CGFloat = 0
//        var gB:CGFloat = 0
//        var bB:CGFloat = 0
//        var aB:CGFloat = 0
//        otherColor.getRed(&rB, green: &gB, blue: &bB, alpha: &aB)
//
//        return UIColor(red: CGFloat(average(Float(rA),Float(rB))) , green: CGFloat(average(Float(gA),Float(gB))), blue: CGFloat(average(Float(bA),Float(bB))), alpha: CGFloat(average(Float(aA),Float(aB))))
//    }