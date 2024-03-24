//
//  Mark.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/5.
//

import UIKit

// 第三章: 原型模式
/*
 理念: 好比用橡皮图章在纸上拓印，无需手工创建，就可制造一个类的大量实例
 何时使用原型模式: 不同类的实例之间的差异仅仅是状态的若干组合
 */
// 为什么要符合NSCopying协议，因为符合之后可以进行深拷贝
protocol Mark: NSObject {
    var color: UIColor { get set }
    var size: CGFloat { get set }
    var location: CGPoint { get set }
    /// 子节点个数
    var count: Int { get }
    var lastChild: (any Mark)? { get }
    
    func addMark(mark: any Mark)
    func removeMark(mark: any Mark)
    func childAtIndex(index: UInt) -> (any Mark)?
    /// 返回类的实例
    func copy() -> Any
}

/// 顶点
class Vertex: NSObject, Mark, NSCopying {
    var color: UIColor = .black
    
    var size: CGFloat = 0.0
    
    var location: CGPoint = .zero
    
    var count: Int = 0
    
    var lastChild: (any Mark)?
    
    convenience init(with location: CGPoint) {
        self.init()
        self.location = location
    }
    
    func addMark(mark: any Mark) {}
    
    func removeMark(mark: any Mark) {}
    
    func childAtIndex(index: UInt) -> (any Mark)? {
        return nil
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let vertexCopy = Vertex(with: self.location)
        return vertexCopy
    }
    
}

/// 线条
class Stroke: NSObject, Mark, NSCopying {
    
    private var location_: CGPoint = .zero
    
    var children: [any Mark] = []
    
    var color: UIColor = .black
    
    var size: CGFloat = 0.0
    
    var location: CGPoint {
        get {
            if let firstChild = self.children.first {
                return firstChild.location
            } else {
                return location_
            }
        }
        
        set {
            location_ = newValue
        }
    }
    
    var count: Int {
        get {
            self.children.count
        }
    }
    
    var lastChild: (any Mark)? {
        get {
            return self.children.last
        }
    }
    
    func addMark(mark: any Mark) {
        self.children.append(mark)
    }
    
    func removeMark(mark: any Mark) {
        if let index = children.firstIndex(where: { $0 === mark }) {
            children.remove(at: index)
        } else {
            for mark in self.children {
                mark.removeMark(mark: mark)
            }
        }
    }
    
    func childAtIndex(index: UInt) -> (any Mark)? {
        if index >= self.children.count { return nil }
        
        return self.children[Int(index)]
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Stroke()
        return copy
    }

}

/// 点
class Dot: Vertex {
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let dotCopy = Dot(with: self.location)
        dotCopy.color = self.color
        dotCopy.size = self.size
        return dotCopy
    }
}
