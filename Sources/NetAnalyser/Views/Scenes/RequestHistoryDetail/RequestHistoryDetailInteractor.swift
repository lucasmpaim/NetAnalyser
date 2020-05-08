//
//  RequestHistoryDetailInteractor.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryDetailBusinessLogic {
    func getDetail(request: RequestHistoryDetail.GetInfo.Request)
}

protocol RequestHistoryDetailDataStore {
    var history: RequestHistory? { get set }
}

class RequestHistoryDetailInteractor: RequestHistoryDetailBusinessLogic, RequestHistoryDetailDataStore {

    // Var's
    var presenter: RequestHistoryDetailPresentationLogic?
    var worker = RequestHistoryDetailWorker()

    var history: RequestHistory?
    
    func getDetail(request: RequestHistoryDetail.GetInfo.Request) {
        guard let history = self.history else { return }
        presenter?.presentDetail(response: RequestHistoryDetail.GetInfo.Response(history: history))
    }
}
