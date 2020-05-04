//
//  Storage.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public protocol NetworkStorage {
    func saveRequestHistory(_ request: RequestHistory)
}
