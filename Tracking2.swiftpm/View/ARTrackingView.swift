//
//  CustomARView.swift
//  Tracking
//
//  Created by YU WONGEUN on 2023/04/05.
//

import Foundation
import SwiftUI
import ARKit
import SceneKit

struct ARTrackingView: UIViewRepresentable {
    
    typealias UIViewType = ARSCNView
    
    var view: ARSCNView
    var options: [Any] = []
    
    func makeUIView(context: Context) -> ARSCNView {
        view.session.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
    }
    
    func makeCoordinator() -> coordinator {
        coordinator(self.view)
        
    }
}

class coordinator: NSObject, ARSCNViewDelegate, ARSessionDelegate {
    
    var sceneView: ARSCNView!
    let face = SCNNode()
    let leftEye = EyeNode(color: .red)
    let rightEye = EyeNode(color: .blue)
    let viewPlane = SCNNode(geometry: SCNPlane(width: 1, height: 1))
    
    let aimImageView = UIImageView(image: UIImage(named: "Cursor"))
    
    public var eyeGazeHistory = Array<CGPoint>()
    
    let numberOfSmoothUpdates = 70
    
    let configuration = ARFaceTrackingConfiguration()
    
    
    init(_ view: ARSCNView) {
        
        self.sceneView = view
        super.init()
        
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        self.sceneView.delegate = self
        sceneView.scene.rootNode.addChildNode(face)
        
        face.addChildNode(leftEye)
        face.addChildNode(rightEye)
        
        sceneView.scene.rootNode.addChildNode(viewPlane)
        setupLayout()
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device.")
        }
        
        
    }
    
    deinit {
        self.sceneView.scene.rootNode.cleanup()
        self.aimImageView.removeFromSuperview()
        self.sceneView.session.pause()
        self.sceneView = nil
    }
    
    
    func eyeTracking(using anchor: ARFaceAnchor)  {
        
        leftEye.simdTransform = anchor.leftEyeTransform
        rightEye.simdTransform = anchor.rightEyeTransform
        
        let intersectPoints = [leftEye, rightEye].compactMap { eye -> CGPoint? in
            let hitTest = self.viewPlane.hitTestWithSegment(from: eye.target.worldPosition, to: eye.worldPosition)
            
            return hitTest.first?.screenPosition
            
        }
        
        guard let leftPoint = intersectPoints.first,
              let rightPoint = intersectPoints.last else { return }
        
        let centerPoint = CGPoint(x: (leftPoint.x + rightPoint.x) / 2, y: -(leftPoint.y + rightPoint.y) / 2)
        
        eyeGazeHistory.append(centerPoint)
        eyeGazeHistory = eyeGazeHistory.suffix(numberOfSmoothUpdates)
        aimImageView.transform = eyeGazeHistory.averageAffineTransform
    }
    
    func setupLayout() {
        aimImageView.frame.size = CGSize(width: 30, height: 30)
        sceneView.addSubview(aimImageView)
    }
}

extension coordinator {
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        DispatchQueue.main.async {
            self.face.simdTransform = node.simdTransform
            self.eyeTracking(using: faceAnchor)
        }
    }
}

