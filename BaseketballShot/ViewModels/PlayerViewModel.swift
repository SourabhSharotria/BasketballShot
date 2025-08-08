//
//  PlayerViewModel.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Foundation

class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = []

    func loadPacers() {
        players = JSONLoader.loadPlayers(from: "Players_Pacers_1610612754")
    }

    func loadNets() {
        players = JSONLoader.loadPlayers(from: "Players_Nets_1610612751")
    }
}
