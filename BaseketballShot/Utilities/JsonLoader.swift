//
//  JsonLoader.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import Foundation

class JSONLoader {
    static func loadPlayers(from filename: String) -> [Player] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("❌ Failed to find \(filename).json")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(PlayersResponse.self, from: data)
            return decoded.data.players
        } catch {
            print("❌ Decoding error: \(error)")
            return []
        }
    }
}
