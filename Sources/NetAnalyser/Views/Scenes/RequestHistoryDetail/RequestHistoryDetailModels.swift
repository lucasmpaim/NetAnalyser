//
//  RequestHistoryDetailModels.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RequestHistoryDetail {

    enum GetInfo {
        struct Request { }
        struct Response {
            let history: RequestHistory
        }
        struct ViewModel {
            let history: RequestHistory
        }
    }
    
}
