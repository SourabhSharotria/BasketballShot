//
//  ShotChartView.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import SwiftUI
import SceneKit

struct ShotChartView: UIViewRepresentable {
    let player: Player
    let viewModel: ShotChartViewModel

    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = SCNScene()
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = .white

        // Add floor
        let floor = SCNBox(width: 28, height: 0.1, length: 15, chamferRadius: 0)
        let floorNode = SCNNode(geometry: floor)

        if let courtImage = UIImage(named: "court_image") {
            let material = SCNMaterial()
            material.diffuse.contents = courtImage
            material.lightingModel = .physicallyBased
            material.isDoubleSided = true
            floor.materials = [material]
        }
        
//        floor.firstMaterial?.diffuse.contents = UIColor.brown
        floorNode.position = SCNVector3(0, -0.05, 0)
        scnView.scene?.rootNode.addChildNode(floorNode)

        // Add camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 10, z: 25)
        cameraNode.eulerAngles = SCNVector3Make(-0.5, 0, 0) // Tilt down
        scnView.scene?.rootNode.addChildNode(cameraNode)

        return scnView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {
        let scene = scnView.scene!

        // Clear old shots
        scene.rootNode.enumerateChildNodes { node, _ in
            if node.name == "shotBall" {
                node.removeFromParentNode()
            }
        }

        let shots = viewModel.shots(for: player)
        print("Found \(shots.count) shots")

        for shot in shots {
            guard let trajectory = shot.trajectory else {
                print("Missing trajectory for shot")
                continue
            }

            let scnTrajectory = trajectory.map { $0.asSCNVector3 }
            ShotAnimator().animateBall(trajectory: scnTrajectory, in: scene)
        }
    }
}
