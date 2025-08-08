//
//  ShotModel.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Foundation
import SceneKit

struct ShotModel: Identifiable, Decodable {
    let id: UUID
    let playerId: String
    let x: Float
    let y: Float
    let z: Float
    let time: Date
    let result: ShotResult
    let shotType: String
    let trajectory: [Vector3]?

    // Optional: Convert to SCNVector3 at usage
    var position: SCNVector3 {
        SCNVector3(x, y, z)
    }
}

enum ShotResult: String, Decodable {
    case made
    case missed
}

struct Vector3: Codable {
    let x: Float
    let y: Float
    let z: Float
    
    init(x: Float, y: Float, z: Float) {
           self.x = x
           self.y = y
           self.z = z
       }

    var asSCNVector3: SCNVector3 {
        SCNVector3(x, y, z)
    }

    init(from vector: SCNVector3) {
        self.x = vector.x
        self.y = vector.y
        self.z = vector.z
    }
}
