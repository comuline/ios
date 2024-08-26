//
//  ComulineModels.swift
//  comuline
//
//  Created by mac on 10/8/24.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: Int
    let data: T
}

struct Station: Codable, Identifiable {
    let id: String
    let name: String
    let daop: Int
    let fgEnable: Int
    let haveSchedule: Bool
    let updatedAt: String
}

struct Schedule: Codable, Identifiable {
    let id: String
    let stationId: String
    let trainId: String
    let line: String
    let route: String
    let color: String
    let destination: String
    let timeEstimated: String
    let destinationTime: String
    let updatedAt: String
}

struct RouteSchedule: Codable, Identifiable {
    let id: String
    let stationId: String
    let trainId: String
    let line: String
    let route: String
    let color: String
    let destination: String
    let timeEstimated: String
    let destinationTime: String
    let updatedAt: String
}

struct SyncData: Codable, Identifiable {
    let id: String
    let n: Int
    let type: String
    let status: String
    let item: String
    let duration: Int?
    let message: String?
    let startedAt: String
    let endedAt: String
    let createdAt: String
}
