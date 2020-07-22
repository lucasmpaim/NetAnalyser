//
//  RequestHistoryDetailModels.swift
//
//
//  Created by Lucas Paim on 06/05/20.
//

import UIKit

enum RequestHistoryDetail {

    enum GetInfo {
        struct Request { }
        struct Response {
            let history: RequestHistory
        }
        struct ViewModel {
            let curl: String
            let uri: String
            let method: String
            let server: String
            let path: String
            let startTime: String
            let endTime: String
            let duration: String
            let body: String
            let isUsingSSL: String

            let httpStatus: String
            let response: String
            let errorDescription: String
        }
    }

    enum Share {
        struct Request { }
        struct Response {
            let history: RequestHistory
        }
        struct ViewModel {
            let shareMessage: String
        }
    }
    
}
