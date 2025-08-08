//
//  ShotRepository.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Combine

class LiveShotService {
    private let sdk = ShotFeedSDKWrapper()
    private var shotsSubject = CurrentValueSubject<[ShotModel], Never>([])
    
    var shotsPublisher: AnyPublisher<[ShotModel], Never> {
        shotsSubject.eraseToAnyPublisher()
    }

    func startLiveGame() {
        sdk.startListening { shot in
            var current = self.shotsSubject.value
            current.append(shot)
            self.shotsSubject.send(current)
        }
    }

    func fetchHistoricalShots(for gameId: String) {
        sdk.fetchHistoricalShots(gameId: gameId) { shots in
            self.shotsSubject.send(shots)
        }
    }
}
