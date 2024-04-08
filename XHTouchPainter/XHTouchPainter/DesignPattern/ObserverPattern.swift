//
//  ObserverPattern.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/21.
//

import Foundation

class Subject {
    
    private var observers: [Observer] = []
    
    private var _state: Int = 0
    
    var state: Int {
        set {
            self._state = newValue
            notify()
        }
        get {
            return _state
        }
    }
    
    func notify() {
        observers.forEach({ $0.update() })
    }
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func detach(observer: Observer) {
        guard let index = observers.firstIndex(where: { $0.id == observer.id }) else { return }
        observers.remove(at: index)
    }
}

protocol Observer {
    var id: String { get set }
    var subject: Subject { get set }
    func update()
}

class BinaryObserver: Observer {
    var subject: Subject
    var id: String
    
    init(subject: Subject, id: String) {
        self.subject = subject
        self.id = id
        self.subject.attach(observer: self)
    }
    
    func update() {
        let val = String(subject.state, radix: 2, uppercase: true)
        print("2: \(val)")
    }
}



