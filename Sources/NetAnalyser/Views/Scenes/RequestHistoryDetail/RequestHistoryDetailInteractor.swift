//
//  RequestHistoryDetailInteractor.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//

import UIKit

protocol RequestHistoryDetailBusinessLogic {
    func getDetail(request: RequestHistoryDetail.GetInfo.Request)
    func share(request: RequestHistoryDetail.Share.Request)
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

    func share(request: RequestHistoryDetail.Share.Request) {
        guard let history = self.history else { return }
        presenter?.share(response: RequestHistoryDetail.Share.Response(history: history))
    }
}
