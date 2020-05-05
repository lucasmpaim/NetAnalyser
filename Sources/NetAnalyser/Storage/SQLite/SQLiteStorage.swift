//
//  Database.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation
import SQLite3

public class SQLiteStorage : NetworkStorage {
    
    public static var instance: SQLiteStorage = SQLiteStorage()
    let dbPath = "netanalyserdb.sqlite3"
        
    private init() { }

    
    public func saveRequestHistory(_ request: RequestHistory) throws {
                
        func saveRequest() throws -> Int {
            //method, server, path
            return try makeInsertion(sql: TableConstants.kRequestTableInsertSQL) { statement in
                sqlite3_bind_text(statement, 1, request.request.method.utf8String, -1, nil)
                sqlite3_bind_text(statement, 2, request.request.server.utf8String, -1, nil)
                sqlite3_bind_text(statement, 3, request.request.path.utf8String, -1, nil)
            }
            
        }
        
        func saveHistory(requestId: Int) throws {
            // body, start_time, end_time, response, error_description,
            // curl, http_status, request_id
            try makeInsertion(sql: TableConstants.kRequestHistoryInsertSQL) { statement in
                sqlite3_bind_text(statement, 1, request.body?.utf8String, -1, nil)
                sqlite3_bind_double(statement, 2, request.startTime.timeIntervalSince1970)
                sqlite3_bind_double(statement, 3, request.endTime.timeIntervalSince1970)
                sqlite3_bind_text(statement, 4, request.response?.utf8String, -1, nil)
                sqlite3_bind_text(statement, 5, request.errorDescription?.utf8String, -1, nil)
                sqlite3_bind_text(statement, 6, request.curl?.utf8String, -1, nil)
                sqlite3_bind_int(statement, 7, Int32(request.httpStatus))
                sqlite3_bind_int(statement, 8, Int32(requestId))
            }
        }
        
        let requestId = try saveRequest()
        try saveHistory(requestId: requestId)
    }
    
    public func fetchAllHistory() throws -> [RequestHistory] {
        var response: [RequestHistory] = []
        
        try withConnection { dbConenction in
            var queryStatement: OpaquePointer?
            guard sqlite3_prepare_v2(dbConenction, TableConstants.kSelectRequestHistorySQL,
                                     -1, &queryStatement, nil) == SQLITE_OK else {
                throw DatabaseConnectionError()
            }
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                                
                let request = Request(
                    method: sqlite3_column_text(queryStatement, 0)!.safeString,
                    server: sqlite3_column_text(queryStatement, 1)!.safeString,
                    path: sqlite3_column_text(queryStatement, 2)!.safeString,
                    id: Int(sqlite3_column_int(queryStatement, 9))
                )
                
                let history = RequestHistory(
                    request: request,
                    startTime: Date(timeIntervalSince1970: sqlite3_column_double(queryStatement, 4)),
                    endTime: Date(timeIntervalSince1970: sqlite3_column_double(queryStatement, 5)),
                    httpStatus: Int(sqlite3_column_int(queryStatement, 9)),
                    body: sqlite3_column_text(queryStatement, 3)?.safeString,
                    response: sqlite3_column_text(queryStatement, 6)?.safeString,
                    errorDescription: sqlite3_column_text(queryStatement, 7)?.safeString,
                    curl: sqlite3_column_text(queryStatement, 8)?.safeString,
                    id: Int(sqlite3_column_int(queryStatement, 10))
                )
                response.append(history)
            }
            
        }
        
        return response
    }
    
    public func fetchAllRequests() throws -> [Request] {
        var response: [Request] = []
        
        try withConnection { dbConenction in
            var queryStatement: OpaquePointer?
            guard sqlite3_prepare_v2(dbConenction, TableConstants.kSelectAllRequestsSQL,
                                     -1, &queryStatement, nil) == SQLITE_OK else {
                throw DatabaseConnectionError()
            }
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let request = Request(
                    method: sqlite3_column_text(queryStatement, 1)!.safeString,
                    server: sqlite3_column_text(queryStatement, 2)!.safeString,
                    path: sqlite3_column_text(queryStatement, 3)!.safeString,
                    id: Int(sqlite3_column_int(queryStatement, 0))
                )
                response.append(request)
            }
        }
        return response
    }
    
    public func fetchHistoryFor(_ requestId: Int) throws -> [RequestHistory] {
        var response: [RequestHistory] = []
        
        try withConnection { dbConenction in
            var queryStatement: OpaquePointer?
            guard sqlite3_prepare_v2(dbConenction, TableConstants.kSelectRequestHistoryByRequestSQL,
                                     -1, &queryStatement, nil) == SQLITE_OK else {
                throw DatabaseConnectionError()
            }
            
            sqlite3_bind_int(queryStatement, 0, Int32(requestId))
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                                
                let request = Request(
                    method: sqlite3_column_text(queryStatement, 0)!.safeString,
                    server: sqlite3_column_text(queryStatement, 1)!.safeString,
                    path: sqlite3_column_text(queryStatement, 2)!.safeString,
                    id: Int(sqlite3_column_int(queryStatement, 9))
                )
                
                let history = RequestHistory(
                    request: request,
                    startTime: Date(timeIntervalSince1970: sqlite3_column_double(queryStatement, 4)),
                    endTime: Date(timeIntervalSince1970: sqlite3_column_double(queryStatement, 5)),
                    httpStatus: Int(sqlite3_column_int(queryStatement, 9)),
                    body: sqlite3_column_text(queryStatement, 3)?.safeString,
                    response: sqlite3_column_text(queryStatement, 6)?.safeString,
                    errorDescription: sqlite3_column_text(queryStatement, 7)?.safeString,
                    curl: sqlite3_column_text(queryStatement, 8)?.safeString,
                    id: Int(sqlite3_column_int(queryStatement, 10))
                )
                response.append(history)
            }
        }
        return response

    }
    
    public func clear() throws {
        try deleteDatabase()
    }

}



extension String {
    var utf8String : UnsafePointer<Int8>? {
        (self as NSString).utf8String
    }
}

extension UnsafePointer where Pointee == UInt8 {
    var safeString: String {
        String(cString: self)
    }
}
