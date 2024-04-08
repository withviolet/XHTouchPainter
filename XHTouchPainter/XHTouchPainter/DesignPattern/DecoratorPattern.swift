//
//  DecoratorPattern.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/29.
//

import UIKit
import Foundation

protocol ImageComponentProtocol {
    func apply() -> UIImage
}

extension UIImage: ImageComponentProtocol {
    func apply() -> UIImage {
        return self
    }
}

class ImageFilter: ImageComponentProtocol {
    
    var component: ImageComponentProtocol
    
    init(component: ImageComponentProtocol) {
        self.component = component
    }
    
    func apply() -> UIImage {
        // 由子类重载
        return component.apply()
    }
    
}
// 滤镜1 变换滤镜
class ImageTransformFilter: ImageFilter {
    var transform: CGAffineTransform
    
    init(component: ImageComponentProtocol, transform: CGAffineTransform) {
        self.transform = transform
        super.init(component: component)
    }
    
    override func apply() -> UIImage {
        let originalImage = super.apply()
        let originalImageSize = originalImage.size
        UIGraphicsBeginImageContext(originalImageSize)
        let context = UIGraphicsGetCurrentContext()!
        context.concatenate(self.transform)
        originalImage.draw(in: CGRect(origin: .zero, size: originalImageSize))
        let fixedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return fixedImage
    }
}

// 滤镜2 阴影滤镜
class ImageShadowFilter: ImageFilter {
    override func apply() -> UIImage {
        let originalImage = super.apply()
        let originalImageSize = originalImage.size
        UIGraphicsBeginImageContext(originalImageSize)
        let context = UIGraphicsGetCurrentContext()!
        let offset = CGSize(width: -25, height: 15)
        context.setShadow(offset: offset, blur: 20.0)
        originalImage.draw(in: CGRect(origin: .zero, size: originalImageSize))
        let fixedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return fixedImage
    }
}
