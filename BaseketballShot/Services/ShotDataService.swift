//
//  ShotDataService.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 09/08/25.
//

import CoreData

protocol ShotDataServiceProtocol: AnyObject {
    func saveShot(_ shot: ShotModel)
    func fetchShots() -> [ShotModel]
}

final class ShotDataService: ShotDataServiceProtocol {
    private let coreDataService: CoreDataService

    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }

    func saveShot(_ shot: ShotModel) {
        let context = coreDataService.context
        let entity = ShotData(context: context)

        entity.playerId = shot.playerId
        entity.x = shot.x
        entity.y = shot.y
        entity.z = shot.z
        entity.time = shot.time
        entity.result = shot.result.rawValue
        entity.shotType = shot.shotType
        entity.trajectory = try? JSONEncoder().encode(shot.trajectory)

        coreDataService.saveContext()
    }

    func fetchShots() -> [ShotModel] {
        let request: NSFetchRequest<ShotData> = ShotData.fetchRequest()
        do {
            return try coreDataService.context.fetch(request).map { entity in
                ShotModel(
                    id: UUID(),
                    playerId: entity.playerId ?? "",
                    x: entity.x,
                    y: entity.y,
                    z: entity.z,
                    time: entity.time ?? Date(),
                    result: ShotResult(rawValue: entity.result ?? "missed") ?? .missed,
                    shotType: entity.shotType ?? "",
                    trajectory: entity.trajectory.flatMap {
                        try? JSONDecoder().decode([Vector3].self, from: $0)
                    }
                )
            }
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }
}

