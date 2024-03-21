//
//  Scribble.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/21.
//

import UIKit

class Scribble: NSObject {
    
    var parentMark: Mark = Stroke()
    
    func addMark(aMark: Mark?, shouldAddToPreviousMark: Bool) {
        self.willChangeValue(forKey: "parentMark")
    }
    
    func removeMark(aMark: Mark?) {
        if aMark === parentMark { return }
        self.willChangeValue(forKey: "parentMark")
    }
    
}
