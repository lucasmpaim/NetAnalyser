//
//  RequestHistoryListRouter.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RequestHistoryListRoutingLogic {
    func routeToRequestHistoryDetail()
}

protocol RequestHistoryListDataPassing {
    var dataStore: RequestHistoryListDataStore? { get }
}

class RequestHistoryListRouter: NSObject, RequestHistoryListRoutingLogic, RequestHistoryListDataPassing {

    // Var's
    weak var viewController: RequestHistoryListViewController?
    var dataStore: RequestHistoryListDataStore?

    
    func routeToRequestHistoryDetail() {
        let vc = RequestHistoryDetailViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
