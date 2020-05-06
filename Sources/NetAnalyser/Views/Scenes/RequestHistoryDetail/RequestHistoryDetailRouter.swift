//
//  RequestHistoryDetailRouter.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RequestHistoryDetailRoutingLogic {

}

protocol RequestHistoryDetailDataPassing {
    var dataStore: RequestHistoryDetailDataStore? { get }
}

class RequestHistoryDetailRouter: NSObject, RequestHistoryDetailRoutingLogic, RequestHistoryDetailDataPassing {

    // Var's
    weak var viewController: RequestHistoryDetailViewController?
    var dataStore: RequestHistoryDetailDataStore?

}
