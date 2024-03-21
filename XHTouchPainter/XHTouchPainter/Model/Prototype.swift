//
//  Prototype.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/5.
//

import Foundation
import UIKit

// 第三章
/// 原型模式
class Prototype {
    func clone() -> Prototype { return Prototype() }
}

class Client {
    var prototype: Prototype
    
    init(prototype: Prototype) {
        self.prototype = prototype
    }
    
    func operation() {
        self.prototype = self.prototype.clone()
    }
    
}

class ConcretePrototype1: Prototype {
    var title: String = "ConcretePrototype1"
    override func clone() -> ConcretePrototype1 {
        return ConcretePrototype1()
    }
}

class ConcretePrototype2: Prototype {
    var title: String = "ConcretePrototype2"
    override func clone() -> ConcretePrototype2 {
        return ConcretePrototype2()
    }
}

//var color: UIColor = .white
//
//var size: CGFloat = 0
//
//var location: CGPoint = .zero
//
//var count: UInt = 0
//
//init(with location: CGPoint) {
//    self.location = location
//}
//
//func addMark(mark: Mark) {
//    
//}
//
//func removeMark(mark: Mark) {
//    
//}
//
//func childAtIndex(index: UInt) -> Mark {
//    
//}
//
//func copy(with zone: NSZone? = nil) -> Any {
//    let copy = Vertex(with: self.location)
//    return copy
//}
