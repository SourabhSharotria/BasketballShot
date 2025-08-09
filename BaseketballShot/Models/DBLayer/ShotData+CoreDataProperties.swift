//
//  ShotData+CoreDataProperties.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 09/08/25.
//
//

import Foundation
import CoreData


extension ShotData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShotData> {
        return NSFetchRequest<ShotData>(entityName: "ShotData")
    }

    @NSManaged public var playerId: String?
    @NSManaged public var result: String?
    @NSManaged public var x: Float
    @NSManaged public var y: Float
    @NSManaged public var z: Float
    @NSManaged public var time: Date?
    @NSManaged public var shotType: String?
    @NSManaged public var trajectory: Data?

}

extension ShotData : Identifiable {

}
