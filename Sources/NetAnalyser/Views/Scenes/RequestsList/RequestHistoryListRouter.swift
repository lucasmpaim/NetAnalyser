//
//  RequestHistoryListRouter.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryListRoutingLogic {
    func routeToRequestHistoryDetail(history: RequestHistory)
}

protocol RequestHistoryListDataPassing {
    var dataStore: RequestHistoryListDataStore? { get }
}

class RequestHistoryListRouter: NSObject, RequestHistoryListRoutingLogic, RequestHistoryListDataPassing {

    // Var's
    weak var viewController: RequestHistoryListViewController?
    var dataStore: RequestHistoryListDataStore?

    
    func routeToRequestHistoryDetail(history: RequestHistory) {
        let vc = RequestHistoryDetailViewController()
        guard var destDs = vc.router?.dataStore else { return }
        destDs.history = history
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
