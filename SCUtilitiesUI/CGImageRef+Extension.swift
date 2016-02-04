//
//  UIImage+Extension.swift
//  SCUtilities
//
//  Created by Michal Inger on 13/12/2015.
//  Copyright © 2015 stringCode ltd. All rights reserved.
//

#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif


#if os(OSX) || os(iOS) || os(tvOS)

public func CGImageCreateLinerGranient(size: CGSize, points: [CGPoint], colors: [CGColorRef], scale: CGFloat) -> CGImageRef? {
    var params = [String: AnyObject]()
    for (index, element) in points.enumerate() { params["inputPoint\(index)"] = CIVector(CGPoint: element.scaled(scale)) }
    for (index, element) in colors.enumerate() { params["inputColor\(index)"] = CIColor(CGColor: element) }
    let filter = CIFilter(name: "CILinearGradient", withInputParameters: nil)
    filter?.setDefaults()
    filter?.setValuesForKeysWithDictionary(params)
    if let outputImage = filter?.outputImage {
        return context.createCGImage(outputImage, fromRect: CGRect(origin: CGPoint.zero, size: size * scale))
    
    }
    return nil
}

private var context = CIContext()

#endif