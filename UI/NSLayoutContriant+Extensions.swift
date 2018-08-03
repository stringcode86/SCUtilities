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
    public class func constraintsToCoverSuperview(for view: SCView) -> [NSLayoutConstraint] {
        let bindings =  ["view": view]
        var constaints = [NSLayoutConstraint]()
        let options = NSLayoutConstraint.FormatOptions(rawValue: 0)
        let hConsts = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: options, metrics: nil, views: bindings)
        let vConsts = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: options, metrics: nil, views: bindings)
        constaints.append(contentsOf: hConsts)
        constaints.append(contentsOf: vConsts)
        return constaints
    }
    
    ///
    public class func equalSize(for item: Any, toItem: Any, multiplier: CGSize = CGSize(width: 1, height: 1)) -> [NSLayoutConstraint] {
        let w = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: toItem, attribute: .width, multiplier: multiplier.width, constant: 0)
        let h = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: toItem, attribute: .height, multiplier: multiplier.height, constant: 0)
        return [w, h]
    }
    
    ///
    public class func center(item: Any, toItem: Any) -> [NSLayoutConstraint] {
        let x = NSLayoutConstraint.centerXEqual(for: item, toItem: toItem)
        let y = NSLayoutConstraint.centerYEqual(for: item, toItem: toItem)
        return [x, y]
    }

    /// Generates equal width NSLayoutConstraint for items
    public class func equalWidthConstriant(for item: Any, toItem: Any) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: toItem, attribute: .width, multiplier: 1, constant: 0)
    }
    
    public class func heightEqual(to height: CGFloat, forItem: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: forItem, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 0, constant: height)
    }
    
    public class func centerXEqual(for item: Any, toItem: Any) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: toItem, attribute: .centerX, multiplier: 1, constant: 0)
    }
    
    public class func centerYEqual(for item: Any, toItem: Any) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .centerY, relatedBy: .equal, toItem: toItem, attribute: .centerY, multiplier: 1, constant: 0)
    }
    
    public class func verticalSpacing(for item: Any, toItem: Any, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: toItem, attribute: .top, multiplier: 1, constant: offset)
    }
}

#endif

