//
//  SCNHitTestResult.swift
//  Tracking
//
//  Created by YU WONGEUN on 2023/04/06.
//

import UIKit
import SceneKit

extension SCNHitTestResult {
    var screenPosition: CGPoint {
        let physicallIpadSize = CGSize(width: 0.062/2, height: 0.135/2)
        
        // will fix - all ipad physicall size
        //let physicallIpadSize = CGSize(width: 0.138/2, height: 0.239/2)
        
        let sizeResolution = UIScreen.main.bounds.size
        let screenX = CGFloat(localCoordinates.x) / physicallIpadSize.width * sizeResolution.width
        let screenY = CGFloat(localCoordinates.y) / physicallIpadSize.height * sizeResolution.height
        
        return CGPoint(x: screenX, y: screenY)
    }
}

