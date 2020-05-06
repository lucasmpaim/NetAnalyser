//
//  Constants.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


struct TableConstants {

    static let kRequestTableName = "request"
    static let kRequestHistoryTableName = "request_history"

    static let kRequestCreationTableSQL = """
    CREATE TABLE IF NOT EXISTS \(kRequestTableName)(
        request_id INTEGER PRIMARY KEY AUTOINCREMENT,
        method VARCHAR(9) NOT NULL,
        server TEXT NOT NULL,
        path TEXT NOT NULL,
        UNIQUE(path, server, method) ON CONFLICT ABORT
    );
    """
    
    static let kCheckIfExistsRequestSQL = """
    SELECT request_id FROM \(kRequestTableName)
        WHERE method = ? AND
        server = ? AND
        path = ?
    """
    
    static let kRequestHistoryCreationTableSQL = """
    CREATE TABLE IF NOT EXISTS \(kRequestHistoryTableName)(
        history_id INTEGER PRIMARY KEY AUTOINCREMENT,
        body TEXT,
        start_time real NOT NULL,
        end_time real NOT NULL,
        response TEXT,
        error_description TEXT,
        curl TEXT,
        http_status INT NOT NULL,
        request_id INT NOT NULL,
        FOREIGN KEY(request_id) REFERENCES \(kRequestTableName)(request_id)
    );
    """
    
    static let kRequestTableInsertSQL = """
    INSERT INTO \(kRequestTableName)(method, server, path)
    VALUES (?, ?, ?);
    """
    
    static let kRequestHistoryInsertSQL = """
    INSERT INTO \(kRequestHistoryTableName)(
        body, start_time, end_time, response, error_description,
        curl, http_status, request_id
    ) VALUES (?,?,?,?,?,?,?,?);
    """
    
    static let kSelectRequestHistorySQL = """
    SELECT
    r.method, r.server, r.path,
    
    h.body, h.start_time, h.end_time,
    h. response, h. error_description,
    h. curl, h.http_status, r.request_id, h.history_id
    
    FROM \(kRequestHistoryTableName) AS h
        INNER JOIN \(kRequestTableName) AS r ON
        r.request_id = h.request_id
    
    ORDER BY h.start_time DESC
    """
    
    static let kSelectAllRequestsSQL = """
    SELECT
    r.request_id, r.method, r.server, r.path
        FROM \(kRequestTableName) AS r
    """

    static let kSelectRequestHistoryByRequestSQL = """
    SELECT
    r.method, r.server, r.path,
    
    h.body, h.start_time, h.end_time,
    h. response, h. error_description,
    h. curl, h.http_status, r.request_id, h.history_id
    
    FROM \(kRequestHistoryTableName) AS h
        INNER JOIN \(kRequestTableName) AS r ON
        r.request_id = h.request_id
    WHERE
        r.request_id = ?
    
    ORDER BY h.start_time DESC
    """
}
