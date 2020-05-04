//
//  Database+Connection.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation
import SQLite3


extension SQLiteStorage {
    
    func openDatabaseConnection() throws -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var connection: OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &connection) != SQLITE_OK {
            throw DatabaseConnectionError()
        }
        
        return connection
    }
    
    func createNetworkTables() throws {
        let createTableString = """
        \(TableConstants.kRequestCreationTableSQL)
        \(TableConstants.kRequestHistoryCreationTableSQL)
        """
        var creationTableStatement: OpaquePointer?
        guard let db = try? openDatabaseConnection(),
            sqlite3_prepare_v2(db, createTableString, -1, &creationTableStatement, nil) == SQLITE_OK,
            sqlite3_step(creationTableStatement) == SQLITE_DONE
        else { throw DatabaseCreationTableError() }
        sqlite3_finalize(creationTableStatement)
    }
    
}
