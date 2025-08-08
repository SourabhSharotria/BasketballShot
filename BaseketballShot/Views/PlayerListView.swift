//
//  PlayerListView.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 06/08/25.
//

import SwiftUI

import SwiftUI

struct PlayersListView: View {
    @StateObject var vm = PlayersViewModel()

    var body: some View {
        NavigationStack {
            List(vm.players) { player in
                NavigationLink(destination: {
                    let chartVM = ShotChartViewModel(playerId: player.playerId)
                    chartVM.loadDemoData()
                    return ShotChartView(player: player, viewModel: chartVM)
                }()) {
                    HStack {
                        if let url = URL(string: player.images?.headshot ?? "") {
                            AsyncImage(url: url) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        }
                        VStack(alignment: .leading) {
                            Text(player.personName.name)
                            Text(player.teamName)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .onAppear {
                vm.loadPacers()
            }
            .navigationTitle("Select Player")
        }
    }
}
