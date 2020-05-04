//
//  Constants.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


struct TableConstants {

    static let requestTableName = "request"
    static let requestHistoryTableName = "request_history"

    static let kRequestCreationTableSQL = """
    CREATE TABLE IF NOT EXISTS \(requestTableName)(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        method VARCHAR(9) NOT NULL,
        server TEXT NOT NULL,
        path TEXT NOT NULL
    );
    """
    
    static let kRequestHistoryCreationTableSQL = """
    CREATE TABLE IF NOT EXISTS \(requestHistoryTableName)(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        body TEXT,
        start_time real NOT NULL,
        end_time real NOT NULL,
        response TEXT,
        error_description TEXT,
        curl TEXT,
        http_status INT NOT NULL,
        request_id INT NOT NULL,
        FOREIGN KEY(request_id) REFERENCES \(requestTableName)(id)
    );
    """
}
