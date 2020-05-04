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
    
    func withConnection(actions: (OpaquePointer?) throws -> Void) throws {
        guard let dbConnection = try? openDatabaseConnection() else { throw DatabaseConnectionError() }
        defer { sqlite3_close(dbConnection) }
        try actions(dbConnection)
    }
    
    func createNetworkTables() throws {
        
        try withConnection { dbConnection in
            var creationTableStatement: OpaquePointer?
            try [TableConstants.kRequestCreationTableSQL, TableConstants.kRequestHistoryCreationTableSQL].forEach {
                guard sqlite3_prepare_v2(dbConnection, $0, -1, &creationTableStatement, nil) == SQLITE_OK,
                    sqlite3_step(creationTableStatement) == SQLITE_DONE else {
                        throw DatabaseCreationTableError()
                }
            }
            sqlite3_finalize(creationTableStatement)
        }
        
    }

    
    @discardableResult
    func makeInsertion(sql: String, actions: (OpaquePointer?) throws -> Void) throws -> Int {
        
        var insertionId: Int = 0
        
        try withConnection { dbConnection in
            var insertStatement: OpaquePointer? = nil
            guard sqlite3_prepare_v2(dbConnection,
                                     sql,
                                     -1,
                                     &insertStatement,
                                     nil
                ) == SQLITE_OK else {
                    let errorMessage = String(cString: sqlite3_errmsg(dbConnection))
                    debugPrint(errorMessage)
                    throw DatabaseInsertionError()
            }
            
            try actions(insertStatement)

            guard sqlite3_step(insertStatement) == SQLITE_DONE else {
                let errorMessage = String(cString: sqlite3_errmsg(dbConnection))
                print("\nQuery is not prepared! \(errorMessage)")

                throw DatabaseInsertionError()
            }
            
            insertionId = Int(sqlite3_last_insert_rowid(dbConnection))
            sqlite3_finalize(insertStatement)
        }
        
        return insertionId
    }
}
