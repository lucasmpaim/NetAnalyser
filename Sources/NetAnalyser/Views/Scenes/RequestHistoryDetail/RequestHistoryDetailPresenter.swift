//
//  RequestHistoryDetailPresenter.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryDetailPresentationLogic {
    func presentDetail(response: RequestHistoryDetail.GetInfo.Response)
}

class RequestHistoryDetailPresenter: RequestHistoryDetailPresentationLogic {

    // Var's
    weak var viewController: RequestHistoryDetailDisplayLogic?

    func presentDetail(response: RequestHistoryDetail.GetInfo.Response) {
        viewController?.presentDetail(viewModel: RequestHistoryDetail.GetInfo.ViewModel(history: response.history))
    }
}
