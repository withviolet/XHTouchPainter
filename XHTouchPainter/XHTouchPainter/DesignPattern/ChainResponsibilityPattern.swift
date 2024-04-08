//
//  ChainResponsibilityPattern.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/4/8.
//

import Foundation
import UIKit


class Attack: NSObject {
    
}

class SwordAttack: Attack {
    
}

class MagicFireAttack: Attack {
    
}

class LightningAttack: Attack {
    
}

class AttackHandler: NSObject {
    var nextAttackHandler: AttackHandler?
    
    func handle(attack: Attack) {
        nextAttackHandler?.handle(attack: attack)
    }
}

class Avatar: AttackHandler {
    override func handle(attack: Attack) {
        if attack is SwordAttack {
            print("抵挡剑攻击")
        } else {
            nextAttackHandler?.handle(attack: attack)
        }
    }
}

class MetalArmor: AttackHandler {
    override func handle(attack: Attack) {
        if attack is MagicFireAttack {
            print("抵挡魔法攻击")
        } else {
            nextAttackHandler?.handle(attack: attack)
        }
    }
}

class CrystalShield: AttackHandler {
    override func handle(attack: Attack) {
        if attack is LightningAttack {
            print("抵挡光线攻击")
        } else {
            nextAttackHandler?.handle(attack: attack)
        }
    }
}
