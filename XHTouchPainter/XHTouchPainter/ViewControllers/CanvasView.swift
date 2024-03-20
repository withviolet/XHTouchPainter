//
//  CanvasView.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/15.
//

import UIKit
// 第四章、工厂模式
class CanvasView: UIView {

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
