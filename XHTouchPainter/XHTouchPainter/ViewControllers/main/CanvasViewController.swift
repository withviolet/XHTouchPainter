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
    private var canvasView: CanvasView?
    
    lazy var canvasButtonToolBar: CanvasButtomToolBar = {
        let res = CanvasButtomToolBar.init()
        return res
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultGenerator = CanvasViewGenerator.init()
        self.loadCanvasView(with: defaultGenerator)
    }
    
    func setupUI() {
        self.view.addSubview(canvasButtonToolBar)
        canvasButtonToolBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(49)
        }
    }
    
    func loadCanvasView(with generator: CanvasViewGenerator) {
        self.canvasView?.removeFromSuperview()
        let aFrame = CGRectMake(0, 0, 320, 436)
        let aCanvasView = generator.canvasViewWithFrame(aFrame: aFrame)
        self.canvasView = aCanvasView
        self.view.addSubview(self.canvasView!)
        let number = NSNumber(1)
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
