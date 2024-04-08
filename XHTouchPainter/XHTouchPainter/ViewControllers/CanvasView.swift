//
//  CanvasView.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/15.
//

import UIKit
// 第四章、工厂模式
class CanvasView: UIView {
    var testPaths: [XBezierPath] = []
    var mark: Mark?
    var image: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func draw(_ rect: CGRect) {
//        if testPaths.isEmpty { return }
//        
//        for path in self.testPaths {
//            path.lineJoinStyle = .round
//            path.lineWidth = path.model.lineWidth
//            if path.model.isEraser {
//                path.stroke(with: .destinationIn, alpha: 1.0)
//                self.backgroundColor?.set()
//            } else {
//                path.stroke(with: .normal, alpha: 1.0)
//            }
//            path.stroke()
//        }
//    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let markRender = MarkRenderer(with: context)
        self.mark?.acceptMarkVisitor(markRender)
        image?.draw(in: rect)
    }
}

class PaperCanvasView: CanvasView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImage(named: "paper.texture")!
        let backgroundView = UIImageView.init(image: backgroundImage)
        self.addSubview(backgroundView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ClothCanvasView: CanvasView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImage(named: "cloth.texture")!
        let backgroundView = UIImageView.init(image: backgroundImage)
        self.addSubview(backgroundView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
