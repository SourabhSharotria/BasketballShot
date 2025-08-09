//
//  ShotChartViewModel.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Combine
import Foundation

import Combine
import Foundation

class ShotChartViewModel: ObservableObject {
    @Published var shots: [ShotModel] = []
    
    private let liveShotService: LiveShotService
    private var cancellables = Set<AnyCancellable>()
    private let playerId: String
    
    init(playerId: String, liveShotService: LiveShotService) {
        self.playerId = playerId
        self.liveShotService = liveShotService
        
        // Currently temp data
//        liveShotService.shotsPublisher
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$shots)
    }
    
    func startLiveFeed() {
        liveShotService.startLiveGame()
    }
    
    func loadHistoricalGame(gameId: String) {
        liveShotService.fetchHistoricalShots(for: gameId)
    }
    
    func loadDemoData() {
        let arc = [
            Vector3(x: -5, y: 1, z: 0),
            Vector3(x: -2.5, y: 4, z: 0),
            Vector3(x: 0, y: 3, z: 0),
            Vector3(x: 2, y: 2, z: 0),
            Vector3(x: 3, y: 0.5, z: 0)
        ]
        shots = [
            ShotModel(id: UUID(), playerId: self.playerId, x: -5, y: 1, z: 0, time: Date(), result: .made, shotType: "3PT", trajectory: arc),
            ShotModel(id: UUID(), playerId: self.playerId, x: 0, y: 1, z: 0, time: Date(), result: .missed, shotType: "2PT", trajectory: arc)
        ]
    }

    func shots(for player: Player) -> [ShotModel] {
        return shots.filter { $0.playerId == player.playerId }
    }
}

