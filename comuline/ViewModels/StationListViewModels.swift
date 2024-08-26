//
//  StationListViewModels.swift
//  comuline
//
//  Created by mac on 10/8/24.
//

import Foundation

class StationListViewModel: ObservableObject {
    @Published var stations: [Station] = []
    private let apiClient = ComulineAPIClient()
    
    func fetchStations() {
        Task {
            do {
                let fetchedStations = try await apiClient.getStations()
                DispatchQueue.main.async {
                    self.stations = fetchedStations
                }
            } catch {
                print("Error fetching stations: \(error)")
            }
        }
    }
}
