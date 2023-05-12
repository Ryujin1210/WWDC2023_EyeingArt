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

struct ARDrawingView: UIViewRepresentable {
    
    typealias UIViewType = ARSCNView
    
    var view: ARSCNView
    var options: [Any] = []
    
    func makeUIView(context: Context) -> ARSCNView {
        view.session.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self.view)
        
    }
}


class Coordinator: NSObject, ARSCNViewDelegate, ARSessionDelegate {
    
    var sceneView: ARSCNView!
    let face = SCNNode()
    let leftEye = EyeNode(color: .clear)
    let rightEye = EyeNode(color: .clear)
    let viewPlane = SCNNode(geometry: SCNPlane(width: 1, height: 1))
    
    let aimImageView = UIImageView(image: UIImage(named: "AimImage"))
    let canvasImage = UIImage(named: "CanvasImage")
    
    public var eyeGazeHistory = Array<CGPoint>()
    
    let numberOfSmoothUpdates = 70
    
    let line = CAShapeLayer()
    let path = UIBezierPath()
    
    var screenShot: UIImageView!
    
    let configuration = ARFaceTrackingConfiguration()
    
    
    init(_ view: ARSCNView) {
        
        self.sceneView = view
        super.init()
        
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        self.sceneView.delegate = self
        
        sceneView.scene.background.contents = canvasImage
        sceneView.scene.rootNode.addChildNode(face)
        
        face.addChildNode(leftEye)
        face.addChildNode(rightEye)
        
        sceneView.scene.rootNode.addChildNode(viewPlane)
        
        setupLayout()
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device.")
        }
        
        line.strokeColor = UIColor.black.cgColor
        line.lineWidth = 4
        
        line.fillColor = UIColor.clear.cgColor
        self.sceneView.layer.addSublayer(line)
        
    }
    
    deinit {
        self.line.removeFromSuperlayer()
        self.sceneView.scene.rootNode.cleanup()
        self.aimImageView.removeFromSuperview()
        self.sceneView.session.pause()
        self.sceneView = nil
    }
    
    func saveScreenshot() {
        
        self.sceneView.session.pause()
        
        guard let snapshot = self.sceneView.snapshot() else {
            self.sceneView.session.run(configuration)
            
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(snapshot, nil, nil, nil)
        AudioServicesPlaySystemSound(1108)
        
        self.sceneView.session.run(configuration)
    }
    
    
    
    func receiveData(point: CGPoint) {
        let currentPoint = point
        if path.isEmpty {
            path.move(to: currentPoint)
            self.line.path = path.cgPath
        } else {
            path.addLine(to: currentPoint)
            self.line.path = self.path.cgPath
        }
    }
    
    func eyeTracking(using anchor: ARFaceAnchor)  {
        
        if let leftEyeBlink = anchor.blendShapes[.eyeBlinkLeft] as? Float,
           let rightEyeBlink = anchor.blendShapes[.eyeBlinkRight] as? Float {
            if leftEyeBlink > 0.4 && rightEyeBlink > 0.4 {
                
                return
            }
        }
        
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

extension Coordinator {
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        DispatchQueue.main.async {
            
            self.face.simdTransform = node.simdTransform
            self.eyeTracking(using: faceAnchor)
            
        }
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard let faceAnchor = anchors.compactMap({ $0 as? ARFaceAnchor}).first else { return }
        
        // mouthOpen -> draw
        if let Openjaw = faceAnchor.blendShapes[.jawOpen] as? Float {
            if Openjaw > 0.4 {
                receiveData(point: eyeGazeHistory.averagePoint)
            } else {
                path.move(to: eyeGazeHistory.averagePoint)
            }
        }
        
        // frown -> save
        if let browMoveLeft = faceAnchor.blendShapes[.browDownLeft] as? Float,
           let browMoveRight = faceAnchor.blendShapes[.browDownRight] as? Float,
           let noseMoveLeft = faceAnchor.blendShapes[.noseSneerLeft] as? Float,
           let noseMoveRight = faceAnchor.blendShapes[.noseSneerRight] as? Float {
            if browMoveLeft > 0.6 && browMoveRight > 0.6 && noseMoveLeft > 0.4 && noseMoveRight > 0.4
            {
                path.removeAllPoints()
                self.line.path = self.path.cgPath
            }
        }
        
        if let tongue = faceAnchor.blendShapes[.tongueOut] as? Float {
            if tongue > 0.5 {
                self.aimImageView.isHidden = true
                saveScreenshot()
                self.aimImageView.isHidden = false
                
            }
        }
    }
    
}

extension UIView {
    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

