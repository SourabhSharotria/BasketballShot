//
//  CourtScene.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Foundation
import SceneKit


import SceneKit

class CourtScene: SCNScene {
    override init() {
        super.init()
        setupCourt()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCourt() {
        // Add 3D models for court, hoop, stands etc.
    }
}
