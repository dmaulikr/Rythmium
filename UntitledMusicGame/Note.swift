//
// Created by 舒润萱 on 15/4/28.
// Copyright (c) 2015 SRX. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Note: SKShapeNode {
    var NoteSize: CGFloat = 0
    var Time: Double = 0
    static var ID: Int = 0

    convenience init(time: Double, center : CGPoint, radius : CGFloat = 10) {

        let path = CGPathCreateMutable()
        self.init()
        NoteSize = radius
        Time = time
        self.setScale(0.5)
        self.alpha = 0
        self.position = center
        CGPathAddEllipseInRect(path, nil, CGRect(origin: CGPoint(x: -radius / 2, y: -radius / 2), size: CGSize(width: radius, height: radius)))
        self.path = path
        self.glowWidth = 0
        self.lineWidth = 4.0
        self.antialiased = true

    }
}
