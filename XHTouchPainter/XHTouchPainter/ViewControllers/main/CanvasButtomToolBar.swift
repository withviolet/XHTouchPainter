//
//  CanvasButtomToolBar.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/19.
//

import Foundation
import UIKit

class CanvasButtomToolBar: UIToolbar {
    
    lazy var deleteButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "trash")!,
                                       style: .done,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        return res
    }()
    
    lazy var saveButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "square.and.arrow.down")!,
                                       style: .done,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        return res
    }()
    
    lazy var exportButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "square.and.arrow.up")!,
                                       style: .done,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        return res
    }()
    
    lazy var paletteButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "paintpalette")!,
                                       style: .done,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        res.tag = 1
        return res
    }()
    
    lazy var undoButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "arrow.uturn.backward")!,
                                       style: .done,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        return res
    }()
    
    lazy var redoButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "arrow.uturn.right")!,
                                       style: .done,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        return res
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        self.items = [deleteButton, saveButton, exportButton, paletteButton, undoButton, redoButton]
    }
    
    @objc func deleteButtonClicked() {
        
    }
    
    @objc func saveButtonClicked() {
        
    }
    
    @objc func exportButtonClicked() {
        
    }
    
    @objc func paletteButtonClicked() {
        CoordinatingController.shared.requestViewChange(by: self)
    }
    
    @objc func undoButtonClicked() {
        
    }
    
    @objc func redoButtonClicked() {
        
    }
}
