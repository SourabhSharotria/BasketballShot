//
//  PlayerModel.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

struct PlayerModel: Identifiable, Decodable {
    let id: String
    let name: String
    let jerseyNumber: String
    let teamId: String
}

struct PlayersResponse: Codable {
    let data: PlayersData
}

struct PlayersData: Codable {
    let players: [Player]
}

struct Player: Codable, Identifiable {
    var id: String { playerId }
    let playerId: String
    let personName: PersonName
    let teamName: String
    let jerseyNumber: String?
    let positionName: String?
    let images: PlayerImages?
    let height: String?
    let weight: String?
}

struct PersonName: Codable {
    let name: String
    let firstName: String
    let lastName: String
}

struct PlayerImages: Codable {
    let headshot: String?
}
