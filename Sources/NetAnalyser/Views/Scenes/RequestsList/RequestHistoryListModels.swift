//
//  RequestHistoryListModels.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RequestHistoryList {
    enum GetHistory {
        struct Request { }
        enum Response {
            struct Success {
                let data: [RequestHistory]
            }
            struct Failure {
                let error: Error
            }
        }
        enum ViewModel {
            struct Success {
                let data: [RequestHistory]
            }
            struct Failure {
                let error: Error
            }
        }
    }
    
    enum CleanHistory {
        struct Request { }
        enum Response {
            struct Success {
            }
            struct Failure {
                let error: Error
            }
        }
        enum ViewModel {
            struct Success {
            }
            struct Failure {
                let error: Error
            }
        }
    }
    
}
