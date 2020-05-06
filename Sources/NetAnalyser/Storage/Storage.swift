//
//  Storage.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public protocol NetworkStorage {
    func saveRequestHistory(_ request: RequestHistory) throws
    func fetchHistoryFor(_ requestId: Int) throws -> [RequestHistory]
    func fetchAllHistory() throws -> [RequestHistory]
    func fetchAllRequests() throws -> [Request]
    func clear() throws
    func fetchIdForRequest(method: String, path: String, server: String) throws -> Int?
}
