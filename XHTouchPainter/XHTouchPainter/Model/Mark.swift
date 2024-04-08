//
//  Mark.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/5.
//

import UIKit
import Security

// 第三章: 原型模式
/*
 理念: 好比用橡皮图章在纸上拓印，无需手工创建，就可制造一个类的大量实例
 何时使用原型模式: 不同类的实例之间的差异仅仅是状态的若干组合
 */
// 为什么要符合NSCopying协议，因为符合之后可以进行深拷贝
@objc protocol MarkVisitor {
    func visitDot(_ dot: Dot)
    func visitVertex(_ vertex: Vertex)
    func visitStroke(_ stroke: Stroke)
}

//extension MarkVisitor {
//    func visitDot(_ dot: Dot) {}
//    func visitVertex(_ vertex: Vertex) {}
//    func visitStroke(_ stroke: Stroke) {}
//}

class MarkRenderer: MarkVisitor {
    private var shouldMoveContextToDot: Bool
    private var context: CGContext
    
    init(with context: CGContext) {
        self.context = context
        shouldMoveContextToDot = true
    }
    
    func visitDot(_ dot: Dot) {
        let x = dot.location.x
        let y = dot.location.y
        let frameSize = dot.size
        let frame = CGRectMake(x - frameSize / 2.0, y - frameSize / 2.0, frameSize, frameSize)
        context.setFillColor(dot.color.cgColor)
        context.fillEllipse(in: frame)
    }
    
    func visitVertex(_ vertex: Vertex) {
        let x = vertex.location.x
        let y = vertex.location.y
        if shouldMoveContextToDot {
            context.move(to: CGPoint(x: x, y: y))
            shouldMoveContextToDot = false
        } else {
            context.addLine(to: CGPoint(x: x, y: y))
        }
    }
    
    func visitStroke(_ stroke: Stroke) {
        context.setStrokeColor(stroke.color.cgColor)
        context.setLineWidth(stroke.size)
        context.setLineCap(CGLineCap.round)
        context.strokePath()
        shouldMoveContextToDot = true
    }
}

@objc protocol Mark: NSObjectProtocol {
    var color: UIColor { get set }
    var size: CGFloat { get set }
    var location: CGPoint { get set }
    /// 子节点个数
    var count: Int { get }
    var lastChild: (any Mark)? { get }
    
    func addMark(mark: any Mark)
    func removeMark(mark: any Mark)
    func childAtIndex(index: UInt) -> (any Mark)?
    
    func draw(with context: CGContext)
    /// 返回类的实例
    func copy() -> Any
    func acceptMarkVisitor(_ visitor: MarkVisitor)
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
    
    func draw(with context: CGContext) {
        let x = self.location.x
        let y = self.location.y
        
        context.addLine(to: CGPoint(x: x, y: y))
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let vertexCopy = Vertex(with: self.location)
        return vertexCopy
    }
    
    func acceptMarkVisitor(_ visitor: MarkVisitor) {
        visitor.visitVertex(self)
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
    
    func draw(with context: CGContext) {
        context.move(to: CGPoint(x: self.location.x, y: self.location.y))
        for mark in self.children {
            mark.draw(with: context)
        }
        context.setStrokeColor(self.color.cgColor)
        context.strokePath()
    }
    
    func childAtIndex(index: UInt) -> (any Mark)? {
        if index >= self.children.count { return nil }
        
        return self.children[Int(index)]
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Stroke()
        return copy
    }
    
    func acceptMarkVisitor(_ visitor: MarkVisitor) {
        for mark in children {
            mark.acceptMarkVisitor(visitor)
        }
        visitor.visitStroke(self)
    }

}

/// 点
class Dot: Vertex {
    
    override func draw(with context: CGContext) {
        let x = self.location.x
        let y = self.location.y
        let frameSize = self.size
        let frame = CGRect(x: x, y: y, width: frameSize, height: frameSize)
        context.setFillColor(self.color.cgColor)
        context.fillEllipse(in: frame)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let dotCopy = Dot(with: self.location)
        dotCopy.color = self.color
        dotCopy.size = self.size
        return dotCopy
    }
    
    override func acceptMarkVisitor(_ visitor: MarkVisitor) {
        visitor.visitDot(self)
    }
}
