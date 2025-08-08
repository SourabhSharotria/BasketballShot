//
//  CameraManager.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import SceneKit

class CameraManager {
    private var cameraNode: SCNNode!

    func setupCamera(in scene: SCNScene) {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 10, z: 20)
        cameraNode.look(at: SCNVector3Zero)
        scene.rootNode.addChildNode(cameraNode)
    }

    func rotateCamera(by angle: Float) {
        cameraNode.eulerAngles.y += angle
    }
}
