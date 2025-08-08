//
//  CourtModel.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//
import SceneKit

struct CourtModel {
    let width: Float = 28.0
    let length: Float = 15.0
    let hoopPosition: SCNVector3 = SCNVector3(0, 3.05, -7.24) // NBA rim height = 3.05m

    let threePointRadius: Float = 7.24
    let freeThrowLineDistance: Float = 4.57
    let paintWidth: Float = 4.88
    let paintLength: Float = 5.79
}
