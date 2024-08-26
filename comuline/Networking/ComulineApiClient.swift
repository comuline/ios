//
//  ComulineApiClient.swift
//  comuline
//
//  Created by mac on 10/8/24.
//
import Foundation

enum ComulineAPIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case serverError(String)
}

class ComulineAPIClient {
    private let baseURL = "https://api.comuline.com/v1"
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Station Endpoints
    
    func getStations() async throws -> [Station] {
        let url = URL(string: "\(baseURL)/station/")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(APIResponse<[Station]>.self, from: data)
        return response.data
    }
    
    func getStation(id: String) async throws -> Station {
        let url = URL(string: "\(baseURL)/station/\(id)")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(APIResponse<Station>.self, from: data)
        return response.data
    }
    
    // MARK: - Schedule Endpoints
    
    func getSchedule(forStationId stationId: String, isFromNow: Bool = false) async throws -> [Schedule] {
        var urlComponents = URLComponents(string: "\(baseURL)/schedule/\(stationId)")!
        urlComponents.queryItems = [URLQueryItem(name: "is_from_now", value: String(isFromNow))]
        
        guard let url = urlComponents.url else {
            throw ComulineAPIError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(APIResponse<[Schedule]>.self, from: data)
        return response.data
    }
    
    // MARK: - Route Endpoints
    
    func getRoute(forTrainId trainId: String, fromStationId: String? = nil) async throws -> [RouteSchedule] {
        var urlComponents = URLComponents(string: "\(baseURL)/route/\(trainId)")!
        if let fromStationId = fromStationId {
            urlComponents.queryItems = [URLQueryItem(name: "from_station_id", value: fromStationId)]
        }
        
        guard let url = urlComponents.url else {
            throw ComulineAPIError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(APIResponse<[RouteSchedule]>.self, from: data)
        return response.data
    }
    
    // MARK: - Sync Endpoints
    
    func getSyncData() async throws -> [SyncData] {
        let url = URL(string: "\(baseURL)/sync/")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(APIResponse<[SyncData]>.self, from: data)
        return response.data
    }
    
    func getSyncData(id: String) async throws -> SyncData {
        let url = URL(string: "\(baseURL)/sync/\(id)")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(APIResponse<SyncData>.self, from: data)
        return response.data
    }
}
