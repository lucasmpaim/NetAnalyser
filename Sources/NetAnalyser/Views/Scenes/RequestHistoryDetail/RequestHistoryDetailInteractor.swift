//
//  RequestHistoryDetailInteractor.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryDetailBusinessLogic {

}

protocol RequestHistoryDetailDataStore {

}

class RequestHistoryDetailInteractor: RequestHistoryDetailBusinessLogic, RequestHistoryDetailDataStore {

    // Var's
    var presenter: RequestHistoryDetailPresentationLogic?
    var worker = RequestHistoryDetailWorker()

}
