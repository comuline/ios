//
//  StationListView.swift
//  comuline
//
//  Created by mac on 10/8/24.
//


import SwiftUI

struct StationListView: View {
    @StateObject private var viewModel = StationListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.stations) { station in
                VStack(alignment: .leading) {
                    Text(station.name)
                        .font(.headline)
                    Text("ID: \(station.id)")
                        .font(.subheadline)
                    Text("DAOP: \(station.daop)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Stations")
            .onAppear {
                viewModel.fetchStations()
            }
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
    }
}

