//
//  VisitorPattern.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/29.
//

import UIKit

// MARK: 设计模式 访问者模式
protocol Contractor {
    func visitPluming(_ pluming: Plumbing)
    func visitElectrical(_ electrical: Electrical)
}

extension Contractor {
    func visitPluming(_ pluming: Plumbing) {}
    func visitElectrical(_ electrical: Electrical) {}
}
// 水管工
class Plumber: Contractor {
    func visitPluming(_ pluming: Plumbing) { 
        // 修理水管具体操作
    }
}
// 电工
class Electrician: Contractor {
    func visitElectrical(_ electrical: Electrical) { 
        // 修理电线具体操作
    }
}

// 房屋中坏掉的水管和电线，屋主不会修，让专业的人来修
protocol Fixable {
    // 接受承包商
    func acceptContractor(_ contractor: Contractor)
}

// 水管允许水管工来修
class Plumbing: Fixable {
    func acceptContractor(_ contractor: Contractor) {
        contractor.visitPluming(self)
    }
}

// 电路允许电工来修
class Electrical: Fixable {
    func acceptContractor(_ contractor: Contractor) {
        contractor.visitElectrical(self)
    }
}
