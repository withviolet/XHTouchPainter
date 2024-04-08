//
//  BrandingFactory.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/15.
//

import Foundation
import UIKit

class BrandingFactory: NSObject {
    static func factory() -> BrandingFactory {
        return BrandingFactory()
    }
    
    func brandedView() -> UIView? { return nil }
    
    func brandedMainButton() -> UIButton? { return nil }
    
    func brandedToolbar() -> UIToolbar? { return nil }
}

// 假如一个App有多个主题，就可以用抽象工厂方法来管理App的UI，不同的品牌返回不同的UI样式
class AcmeBrandingFactory: BrandingFactory {
    // 在这里重写上面的brand函数
//    override func brandedView() -> UIView? {
//        return AcmeView.init()
//    }
}

class SierraBrandingFactory: BrandingFactory {
    
}
