//
//  CGTypes+Extensions.swift
//  SCUtilities
//
//  Created by Michal Inger on 18/11/2015.
//  Copyright © 2015 stringCode ltd. All rights reserved.
//

#if os(watchOS)
    import WatchKit
#elseif os(OSX)
    import Cocoa
#else
    import UIKit
#endif

//MARK: CGPoint

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

public func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}


public extension CGPoint {
    public func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    public func normalized() -> CGPoint {
        return self / length()
    }
    
    public func scaled(scale: CGFloat) -> CGPoint {
        return CGPoint(x: x * scale, y: y * scale)
    }
    #if os(iOS) || os(tvOS)
    public init?(string: String?) {
        if let string = string {
            let point = CGPointFromString(string)
            self.init(x: point.x, y: point.y)
        } else {
            return nil
        }
    }
    #endif
}

//MARK: CGVector

public func + (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
}

public func - (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
}

public func * (vector: CGVector, scalar: CGFloat) -> CGVector {
    return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
}

public func / (vector: CGVector, scalar: CGFloat) -> CGVector {
    return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
}


public extension CGVector {
    public func length() -> CGFloat {
        return sqrt(dx*dx + dy*dy)
    }
    
    public func normalized() -> CGVector {
        return CGVector(dx: dx / length(), dy: dy / length())
    }
    
    public func toCGPoint() -> CGPoint {
        return CGPoint(x: self.dx, y: self.dy)
    }
}

//MARK: CGRect

public extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self.init(origin: CGPoint(x: center.x - size.width * 0.5, y: center.y - size.height * 0.5), size: size)
    }
    public var minXminY: CGPoint { get { return CGPoint(x: self.minX, y: self.minY) } }
    public var minXmidY: CGPoint { get { return CGPoint(x: self.minX, y: self.midY) } }
    public var minXmaxY: CGPoint { get { return CGPoint(x: self.minX, y: self.maxY) } }
    public var midXminY: CGPoint { get { return CGPoint(x: self.midX, y: self.minY) } }
    public var midXmidY: CGPoint { get { return CGPoint(x: self.midX, y: self.midY) } }
    public var midXmaxY: CGPoint { get { return CGPoint(x: self.midX, y: self.maxY) } }
    public var maxXminY: CGPoint { get { return CGPoint(x: self.maxX, y: self.minY) } }
    public var maxXmidY: CGPoint { get { return CGPoint(x: self.maxX, y: self.midY) } }
    public var maxXmaxY: CGPoint { get { return CGPoint(x: self.maxX, y: self.maxY) } }
    public func sizeFlipedCenterPreservedRect() -> CGRect {
        return CGRect(x: origin.x + (width - height) * 0.5, y: origin.y + (height - width) * 0.5, width: size.height, height: size.width)
    }
}



//MARK: CGSize

public extension CGSize {
    public var greaterDimetion: CGFloat { get { return width > height ? width : height } }
    public var lesserDimetion: CGFloat { get { return width < height ? width : height } }
    public var midPoint: CGPoint { get { return CGPoint(x: width / 2, y: height / 2) } }
    
    #if os(iOS) || os(tvOS)
    public init?(string: String?) {
        if let string = string {
            let size = CGSizeFromString(string)
            self.init(width:size.width, height: size.height)
        } else {
            return nil
        }
    }
    #endif
}

public func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}

public func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}

public func * (size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width * scalar, height: size.height * scalar)
}

public func / (size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width / scalar, height: size.height / scalar)
    
}

// MARK: UIEdgeInsets

public extension UIEdgeInsets {
    /// Cretes inset values from top * heigth , left * width etc of `rect`
    /// Uses those values to inset `rect`
    public func relativeInsetRect(rect:CGRect) -> CGRect {
        let insets = UIEdgeInsets(top: rect.height * top, left: rect.width * left, bottom: rect.height * bottom, right: rect.width * right)
        return UIEdgeInsetsInsetRect(rect, insets)
    }
}