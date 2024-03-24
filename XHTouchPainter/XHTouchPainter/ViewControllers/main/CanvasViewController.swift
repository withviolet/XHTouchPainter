//
//  CanvasViewController.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/15.
//

import UIKit
import SnapKit

// 用户可以在该视图中涂鸦
class CanvasViewController: UIViewController {
    private var scribble_: Scribble?
    var testPaths: [UIBezierPath] = []
    
    private lazy var canvasView: CanvasView = {
        let canvasView = CanvasView(frame: .zero)
        return canvasView
    }()
    
    /// 储存用户点与线的信息
    var scribble: Scribble? {
        set {
            self.scribble_ = newValue
            let options: NSKeyValueObservingOptions = [.initial, .new]
//            self.scribble_?.addObserver(self,
//                                        forKeyPath: "parentMark",
//                                        options: options,
//                                        context: nil)
        }
        get {
            return self.scribble_
        }
    }
    
    private var startPoint: CGPoint = .zero
    private var strokeColor: UIColor = .white
    private var strokeSize: CGFloat = 1.0
    
    lazy var canvasButtonToolBar: CanvasButtomToolBar = {
        let frame = CGRect(x: 0, y: 0, width: UIWindow.keyWindow?.frame.width ?? 120, height: 49)
        let res = CanvasButtomToolBar(frame: frame)
        return res
    }()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    deinit {
//        self.scribble_?.removeObserver(self, forKeyPath: "parentMark")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupScribble()
    }
    
    func setupUI() {
        self.view.addSubview(canvasButtonToolBar)
        canvasButtonToolBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(49)
            make.bottom.equalTo(-UIWindow.safeAreaInsets.bottom)
        }
        
        self.view.addSubview(canvasView)
        canvasView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(canvasButtonToolBar.snp.top)
        }
    }
    
    func setupScribble() {
        self.scribble = Scribble()
    }
}

extension CanvasViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let point = touches.first?.location(in: self.canvasView) else {
            return
        }
        let path = UIBezierPath()
        path.move(to: point)
        self.canvasView.testPaths.append(path)
//        self.startPoint = point
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let point = touches.first?.location(in: self.canvasView) else {
            return
        }
        
        self.canvasView.testPaths.last?.addLine(to: point)
        self.canvasView.setNeedsDisplay()
        
//        guard let lastPoint = touches.first?.previousLocation(in: self.canvasView) else {
//            return
//        }
//        let lastPoint = self.testPaths.last
//        lastPoint?.addLine(to: point)
//        if CGPointEqualToPoint(lastPoint, startPoint) {
//            let newStroke = Stroke()
//            newStroke.color = strokeColor
//            newStroke.size = strokeSize
////            scribble?.addMark(aMark: newStroke, shouldAddToPreviousMark: false)
//        }
//
//        guard let thisPoint = touches.first?.location(in: self.canvasView) else { return }
//        let vertex = Vertex.init(with: thisPoint)
//        scribble?.addMark(aMark: vertex, shouldAddToPreviousMark: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
//        guard let lastPoint = touches.first?.previousLocation(in: self.canvasView) else {
//            return
//        }
//        guard let thisPoint = touches.first?.location(in: self.canvasView) else { return }
//
//        if CGPointEqualToPoint(lastPoint, thisPoint) {
//            let singleDot = Dot(with: thisPoint)
//            singleDot.color = strokeColor
//            singleDot.size = strokeSize
////            scribble?.addMark(aMark: singleDot, shouldAddToPreviousMark: false)
//        }
//
//        startPoint = .zero
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        startPoint = .zero
    }
}

class SetStrokeColorCommand {
    var delegate: SetStrokeColorCommandDelegate?
    
    func execute() {
        var redValue: CGFloat = 0.0
        var greenValue: CGFloat = 0.0
        var blueValue: CGFloat = 0.0
        
        delegate?.command(command: self, didRequestColorComponentsForRed: redValue, green: greenValue, blue: blueValue)
        
        let color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
    }
}

class Command: NSObject {
    func execute() {
        
    }
}

protocol SetStrokeColorCommandDelegate {
    func command(command: SetStrokeColorCommand, didRequestColorComponentsForRed: CGFloat, green: CGFloat, blue: CGFloat)
    func command(command: SetStrokeColorCommand, didFinishColorUpdateWith color: UIColor)
}
