//
//  PaletteViewController.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/18.
//

import UIKit

// 用户可以在此视图中调节线色和线宽
class PaletteViewController: UIViewController {
    
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

    }

}
