//
//  ChasingGame.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/15.
//

import Foundation

// 指导者
class ChasingGame: NSObject {
//    func createPlayer(builder: CharaterBuilder?) -> CharaterBuilder? {
//        let character = builder?.buildNewCharacter()
//        character?.buildStrength(value: 50.0)
//        character?.buildStamina(value: 25.0)
//    }
//    var createEnemy: CharaterBuilder?
    //var createEnemy
}

// 抽象生成器
class CharaterBuilder: NSObject {
    var character: XCharater?
    
    func buildNewCharacter() -> CharaterBuilder? {
        self.character = nil
        self.character = XCharater()
        return self
    }
    
    func buildStrength(value: Float) -> CharaterBuilder? {
        self.character?.strength = value
        return self
    }
    
    func buildStamina(value: Float) -> CharaterBuilder? {
        self.character?.stamina = value
        return self
    }
    
    func buildIntelligence(value: Float) -> CharaterBuilder? {
        self.character?.intelligence = value
        return self
    }
}

// 具体生成器
class standardCharaterBuilder: CharaterBuilder {
    override func buildStrength(value: Float) -> CharaterBuilder? {
        self.character?.protection *= value
        self.character?.power *= value
        return super.buildStrength(value: value)
    }
    
    override func buildStamina(value: Float) -> CharaterBuilder? {
        self.character?.protection *= value
        self.character?.power *= value
        return super.buildStamina(value: value)
    }
    
    override func buildIntelligence(value: Float) -> CharaterBuilder? {
        self.character?.protection *= value
        self.character?.power /= value
        return super.buildIntelligence(value: value)
    }
    
}

class XCharater: NSObject {
    var protection: Float = 1.0
    var power: Float = 1.0
    var strength: Float = 1.0
    var stamina: Float = 1.0
    var intelligence: Float = 1.0
    var agility: Float = 1.0
    var aggressiveness: Float = 1.0
    
}
