//
//  ShotAnimator.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import SceneKit

class ShotAnimator {
    func animateBall(trajectory: [SCNVector3], in scene: SCNScene) {
        guard trajectory.count >= 2 else { return }

        let ball = SCNSphere(radius: 0.4)
        ball.firstMaterial?.diffuse.contents = UIColor.orange

        let ballNode = SCNNode(geometry: ball)
        ballNode.name = "shotBall"
        ballNode.position = trajectory.first!
        scene.rootNode.addChildNode(ballNode)

        let moveActions = trajectory.dropFirst().map {
            SCNAction.move(to: $0, duration: 0.8)
        }

        ballNode.runAction(SCNAction.sequence(moveActions)) {
            ballNode.removeFromParentNode()
        }
    }
}
