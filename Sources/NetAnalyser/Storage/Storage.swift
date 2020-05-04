//
//  Storage.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public protocol NetworkStorage {
    func saveRequestHistory(_ request: RequestHistory) throws
    func fetchHistoryFor(_ request: Request) throws -> [RequestHistory]
    func fetchAllHistory() throws -> [RequestHistory]
    func fetchAllRequests() throws -> [Request]
}
