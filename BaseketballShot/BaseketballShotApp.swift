//
//  BaseketballShotApp.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import SwiftUI

@main
struct BaseketballShotApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                PlayersListView()
            }
        }
    }
}
