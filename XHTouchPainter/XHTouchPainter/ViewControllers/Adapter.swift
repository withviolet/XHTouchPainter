//
//  Adapter.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/18.
//

import Foundation

// 例如港版switch需要转接头才能插上国内的插座
// MARK: - 适配器模式的实现方法一 类适配器
protocol XTarget {
    func request()
}

class Adaptee: NSObject {
    func specificRequest() {
        
    }
}

class Adapter: Adaptee, XTarget {
    func request() {
        super.specificRequest()
    }
}


// MARK: - 适配器模式的实现方法二 对象适配器
class Adapter2: XTarget {
    var adaptee: Adaptee?
    
    func request() {
        self.adaptee?.specificRequest()
    }
}
