//
//  CoordinatingController.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/19.
//

import Foundation
import UIKit

// 第11章，中介者模式
class CoordinatingController: NSObject {
    enum ButtonTag: Int {
        case kButtonTagDone = 0
        case kButtonTagOpenPaletteView // 1
        case kButtonTagOpenThumnailView // 2
    }
    
    private var canvasViewController_: CanvasViewController?
    private var activeViewController_: UIViewController?
    
    var canvasViewController: CanvasViewController? {
        return self.canvasViewController_
    }
    var activeViewController: UIViewController? {
        return self.activeViewController_
    }
    
    override init() { 
        self.canvasViewController_ = CanvasViewController()
    }
    
    static let shared: CoordinatingController = CoordinatingController()
    
    @IBAction func requestViewChange(by object: Any) {
        if object is UIBarButtonItem {
            let tag = (object as! UIBarButtonItem).tag
            let buttonTag = ButtonTag.init(rawValue: tag)
            switch buttonTag {
            case .kButtonTagOpenPaletteView:
                let controller = PaletteViewController.init()
                canvasViewController_?.present(controller, animated: true)
                activeViewController_ = controller
            case .kButtonTagOpenThumnailView:
                let controller = ThumbnailViewController.init()
                canvasViewController_?.present(controller, animated: true)
                activeViewController_ = controller
            default:
                canvasViewController_?.dismiss(animated: true)
                activeViewController_ = canvasViewController_
            }
        } else {
            canvasViewController_?.dismiss(animated: true)
            activeViewController_ = canvasViewController_
        }
    }
    
    
}
