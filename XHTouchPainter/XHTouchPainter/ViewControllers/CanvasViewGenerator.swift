//
//  CanvasViewGenerator.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/15.
//

import Foundation

class CanvasViewGenerator: NSObject {
    
    func canvasViewWithFrame(aFrame: CGRect) -> CanvasView {
        return CanvasView.init(frame: aFrame)
    }
    
}

class PaperCanvasViewGenerator: CanvasViewGenerator {
    override func canvasViewWithFrame(aFrame: CGRect) -> CanvasView {
        return PaperCanvasView.init(frame: aFrame)
    }
}

class ClothCanvasViewGenerator: CanvasViewGenerator {
    override func canvasViewWithFrame(aFrame: CGRect) -> CanvasView {
        return ClothCanvasView.init(frame: aFrame)
    }
}


