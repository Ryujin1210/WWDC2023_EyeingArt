//
//  Collection.swift
//  Tracking
//
//  Created by YU WONGEUN on 2023/04/06.
//

import Foundation
import SceneKit

extension Collection where Element == CGPoint {
    var averageAffineTransform: CGAffineTransform {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for item in self {
            x += item.x
            y += item.y
        }
        
        let elementCount = CGFloat(self.count)
        return CGAffineTransform(translationX: x / elementCount, y: y / elementCount)
    }
    
    var averagePoint: CGPoint {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for item in self {
            x += item.x
            y += item.y
        }
        
        let elementCount = CGFloat(self.count)
        return CGPoint(x: x / elementCount, y: y / elementCount)
    }
}
