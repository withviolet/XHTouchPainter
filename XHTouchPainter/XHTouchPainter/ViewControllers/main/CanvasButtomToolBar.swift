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
                                       style: .plain,
                                       target: self,
                                       action: #selector(self.deleteButtonClicked))
        return res
    }()
    
    lazy var saveButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "square.and.arrow.down")!,
                                       style: .plain,
                                       target: self,
                                       action: #selector(self.saveButtonClicked))
        return res
    }()
    
    lazy var exportButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "square.and.arrow.up")!,
                                       style: .plain,
                                       target: self,
                                       action: #selector(self.exportButtonClicked))
        return res
    }()
    
    lazy var paletteButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "paintpalette")!,
                                       style: .plain,
                                       target: self,
                                       action: #selector(self.paletteButtonClicked))
        res.tag = 1
        return res
    }()
    
    lazy var undoButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "arrow.uturn.backward")!,
                                       style: .plain,
                                       target: self,
                                       action: #selector(self.undoButtonClicked))
        return res
    }()
    
    lazy var redoButton: UIBarButtonItem = {
        let res = UIBarButtonItem.init(image: UIImage.init(systemName: "arrow.uturn.right")!,
                                       style: .plain,
                                       target: self,
                                       action: #selector(self.redoButtonClicked))
        return res
    }()
    
    lazy var spacer: UIBarButtonItem = {
        let res = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
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
        self.items = [deleteButton, spacer, saveButton, spacer, exportButton, spacer, paletteButton, spacer, undoButton, spacer, redoButton]
    }
    
    @objc func deleteButtonClicked() {
        
    }
    
    @objc func saveButtonClicked() {
        
    }
    
    @objc func exportButtonClicked() {
        
    }
    
    @objc func paletteButtonClicked() {
        CoordinatingController.shared.requestViewChange(by: self.paletteButton)
    }
    
    @objc func undoButtonClicked() {
        
    }
    
    @objc func redoButtonClicked() {
        
    }
}
