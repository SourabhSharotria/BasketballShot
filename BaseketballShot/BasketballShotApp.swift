//
//  BasketballShotApp.swift
//  BasketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import SwiftUI
@main
struct BasketballShotApp: App {
    private let coreDataService = CoreDataService()
    private let shotDataService: ShotDataService
    private let liveShotService: LiveShotService

    init() {
        let coreData = CoreDataService()
        self.shotDataService = ShotDataService(coreDataService: coreData)
        self.liveShotService = LiveShotService(shotDataService: shotDataService)
    }

    var body: some Scene {
        WindowGroup {
            PlayersListView()
                .environmentObject(liveShotService) // Pass through environment
        }
    }
}


