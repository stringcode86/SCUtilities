//
//  NSLayoutConstraint+Constraints.swift
//  SCUtilities
//
//  Created by Michal Inger on 09/02/2016.
//  Copyright © 2016 stringCode ltd. All rights reserved.
//

#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif

#if os(iOS) || os(tvOS)
    public typealias SCView = UIView
#elseif os(OSX)
    public typealias SCView = NSView
#endif

#if os(iOS) || os(OSX) || os(tvOS)

/// Counvenience met
public extension NSLayoutConstraint {
    /// Generates layout constraits that will cause `view` to have eqaul size as it's `superview`
    public class func constraintsToCoverSuperviewForView(view: SCView) -> [NSLayoutConstraint] {
        let bindings =  ["view": view]
        var constaints = [NSLayoutConstraint]()
        let options = NSLayoutFormatOptions(rawValue: 0)
        let hConsts = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[view]-0-|", options: options, metrics: nil, views: bindings)
        let vConsts = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[view]-0-|", options: options, metrics: nil, views: bindings)
        constaints.appendContentsOf(hConsts)
        constaints.appendContentsOf(vConsts)
        return constaints
    }
    ///
    public class func equalSizeForItem(item: AnyObject, toItem: AnyObject, sizeMultiplier: CGSize = CGSizeMake(1, 1)) -> [NSLayoutConstraint] {
        let w = NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: toItem, attribute: .Width, multiplier: sizeMultiplier.width, constant: 0)
        let h = NSLayoutConstraint(item: item, attribute: .Height, relatedBy: .Equal, toItem: toItem, attribute: .Height, multiplier: sizeMultiplier.height, constant: 0)
        return [w, h]
    }
    ///
    public class func centerItem(item: AnyObject, toItem: AnyObject) -> [NSLayoutConstraint] {
        let x = NSLayoutConstraint.centerXEqualForItem(item, toItem: toItem)
        let y = NSLayoutConstraint.centerYEqualForItem(item, toItem: toItem)
        return [x, y]
    }

    /// Generates equal width NSLayoutConstraint for items
    public class func equalWidthConstriantForItem(item: AnyObject, toItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: toItem, attribute: .Width, multiplier: 1, constant: 0)
    }
    
    public class func heightEqualTo(height: CGFloat, forItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: forItem, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 0, constant: height)
    }
    
    public class func centerXEqualForItem(item: AnyObject, toItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .CenterX, relatedBy: .Equal, toItem: toItem, attribute: .CenterX, multiplier: 1, constant: 0)
    }
    
    public class func centerYEqualForItem(item: AnyObject, toItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .CenterY, relatedBy: .Equal, toItem: toItem, attribute: .CenterY, multiplier: 1, constant: 0)
    }
    
    public class func verticalSpacingForItem(item: AnyObject, toItem: AnyObject, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .Bottom, relatedBy: .Equal, toItem: toItem, attribute: .Top, multiplier: 1, constant: offset)
    }
}

#endif

