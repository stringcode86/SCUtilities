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
    /// Generates equal width NSLayoutConstraint for items
    public func equalWidthConstriantForItem(item: AnyObject, toItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: toItem, attribute: .Width, multiplier: 1, constant: 0)
    }
    
    public func heightEqualTo(height: CGFloat, forItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: height, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 0, constant: height)
    }
    
    public func centerEqualForItem(item: AnyObject, toItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .CenterX, relatedBy: .Equal, toItem: toItem, attribute: .CenterX, multiplier: 1, constant: 0)
    }
    
    public func verticalSpacingForItem(item: AnyObject, toItem: AnyObject, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .Bottom, relatedBy: .Equal, toItem: toItem, attribute: .Top, multiplier: 1, constant: offset)
    }
    
}

#endif

