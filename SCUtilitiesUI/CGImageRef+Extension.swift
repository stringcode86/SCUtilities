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

public func CGImageCreateOverlayColor(image: CGImageRef, color: CGColorRef) -> CGImageRef {
    let inputImage = CIImage(CGImage: image)
    let overlayImage = CIImage(color: CIColor(CGColor: color)).imageByCroppingToRect(inputImage.extent)
    let filter = CIFilter(name: "CIMultiplyCompositing", withInputParameters: ["inputImage": inputImage, "inputBackgroundImage": overlayImage])
    if let outputImage = filter?.outputImage {
        return context.createCGImage(outputImage, fromRect: inputImage.extent)
    }
    return image
}

private var context = CIContext()

#endif