//
//  PlayerCoreData+CoreDataProperties.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 09/08/25.
//
//

import Foundation
import CoreData


extension PlayerCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerCoreData> {
        return NSFetchRequest<PlayerCoreData>(entityName: "PlayerCoreData")
    }

    @NSManaged public var personName: String?
    @NSManaged public var headshot: String?
    @NSManaged public var height: String?
    @NSManaged public var jerseyNumber: String?
    @NSManaged public var playerId: String?
    @NSManaged public var positionName: String?
    @NSManaged public var teamName: String?
    @NSManaged public var weight: String?

}

extension PlayerCoreData : Identifiable {

}
