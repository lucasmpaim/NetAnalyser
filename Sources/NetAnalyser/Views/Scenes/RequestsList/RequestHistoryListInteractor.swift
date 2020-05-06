//
//  RequestHistoryListInteractor.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryListBusinessLogic {
    func fetchAllHistory(request: RequestHistoryList.GetHistory.Request)
    func cleanHistory(request: RequestHistoryList.CleanHistory.Request)
}

protocol RequestHistoryListDataStore {

}

class RequestHistoryListInteractor: RequestHistoryListBusinessLogic, RequestHistoryListDataStore {

    // Var's
    var presenter: RequestHistoryListPresentationLogic?
    var worker = RequestHistoryListWorker()

    func fetchAllHistory(request: RequestHistoryList.GetHistory.Request) {
        let response = RequestHistoryList.GetHistory.Response.Success(data: worker.fetchHistory())
        presenter?.presentFetchAllHistory(response: response)
    }
    
    func cleanHistory(request: RequestHistoryList.CleanHistory.Request) {
        worker.cleanHistory()
        presenter?.presentCleanHistory(response: RequestHistoryList.CleanHistory.Response.Success())
    }
    
}
