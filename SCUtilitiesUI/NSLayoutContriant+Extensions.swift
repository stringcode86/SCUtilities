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
    
}

#endif

