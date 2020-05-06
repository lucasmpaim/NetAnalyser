//
//  RequestHistoryListWorker.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class RequestHistoryListWorker {

    func fetchHistory() -> [RequestHistory] {
        (try? SQLiteStorage.instance.fetchAllHistory()) ?? []
    }
    
    func cleanHistory()  {
        try? SQLiteStorage.instance.clear()
    }
}
