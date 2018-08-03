//
//  TouchForwardingView.swift
//  SCUtilities
//
//  Created by Michal Inger on 22/03/2016.
//  Copyright © 2016 stringCode ltd. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

public class TouchForwardingView: UIView {
    
    override public func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        // Chech if touch is in self view. If not just return reselt view
        let hitView = super.hitTest(point, withEvent: event)
        if hitView != self {
            return hitView
        }
        // Enumetrate through pass through views
        for passThroughView in (passThroughViews ?? [UIView]()) {
            // convert point to passThroughView and hit test
            if let passThroughHitView = passThroughView.hitTest(self.convertPoint(point, toView: passThroughView), withEvent: event) {
                return passThroughHitView
            }
        }
        // No view found in passThroughView, return self
        return self
    }
    
    /// Views that you would like to get hitTest(_, withEvent:_)
    public var passThroughViews:[UIView]?
}

#endif