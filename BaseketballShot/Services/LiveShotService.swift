//
//  ShotRepository.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Combine
import CoreData

final class LiveShotService: ObservableObject {
    private let sdk = ShotFeedSDKWrapper()
    private let shotDataService: ShotDataServiceProtocol
    private var buffer: ShotBuffer<ShotModel>
    private var shotsSubject = CurrentValueSubject<[ShotModel], Never>([])

    init(shotDataService: ShotDataServiceProtocol) {
        self.shotDataService = shotDataService
        self.buffer = ShotBuffer<ShotModel> { [weak shotDataService] shot in
            shotDataService?.saveShot(shot)
        }
    }

    var shotsPublisher: AnyPublisher<[ShotModel], Never> {
        shotsSubject.eraseToAnyPublisher()
    }

    func startLiveGame() {
        sdk.startListening { [weak self] shot in
            self?.processShot(shot)
        }
    }

    func fetchHistoricalShots(for gameId: String) {
        sdk.fetchHistoricalShots(gameId: gameId) { [weak self] shots in
            self?.shotsSubject.send(shots)
        }
    }

    private func processShot(_ shot: ShotModel) {
        buffer.enqueue(shot)
        var current = shotsSubject.value
        current.append(shot)
        shotsSubject.send(current)
    }
}

