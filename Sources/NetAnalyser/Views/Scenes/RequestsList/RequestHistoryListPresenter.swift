//
//  RequestHistoryListPresenter.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryListPresentationLogic {
    func presentFetchAllHistory(response: RequestHistoryList.GetHistory.Response.Success)
    func presentCleanHistory(response: RequestHistoryList.CleanHistory.Response.Success)
}

class RequestHistoryListPresenter: RequestHistoryListPresentationLogic {

    // Var's
    weak var viewController: RequestHistoryListDisplayLogic?

    func presentFetchAllHistory(response: RequestHistoryList.GetHistory.Response.Success) {
        let viewModel = RequestHistoryList.GetHistory.ViewModel.Success(data: response.data)
        viewController?.displayAllHistory(viewModel: viewModel)
    }
    
    func presentCleanHistory(response: RequestHistoryList.CleanHistory.Response.Success) {
        viewController?.displayCleanHistory(response: RequestHistoryList.CleanHistory.ViewModel.Success())
    }
}
