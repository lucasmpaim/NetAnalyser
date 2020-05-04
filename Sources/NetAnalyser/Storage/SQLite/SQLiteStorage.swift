//
//  Database.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation
import SQLite3

public class SQLiteStorage {
    
    public static var instance: SQLiteStorage = SQLiteStorage()
    let dbPath = "netanalyserdb.sqlite3"
        
    private init() { }


}
