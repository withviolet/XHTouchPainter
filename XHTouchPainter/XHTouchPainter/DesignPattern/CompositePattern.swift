//
//  CompositePattern.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/26.
//

import Foundation

protocol File {
    var name: String { get set }
    func open()
}

final class Music: File {
    var name: String
    var singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
    
    func open() {
        print("在 Apple Music 打开 \(name) by: \(singer)")
    }
}

final class eBook: File {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
    
    func open() {
        print("在 Apple Book 打开 \(name) by: \(author)")
    }
}

final class Folder: File {
    var name: String
    lazy var files: [File] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addFile(file: File) {
        self.files.append(file)
    }
    
    func open() {
        files.forEach { file in
            file.open()
        }
    }
}
