//
//  RequestHistoryDetailViewController+DisplayLogic.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension RequestHistoryDetailViewController: RequestHistoryDetailDisplayLogic {
    func presentDetail(viewModel: RequestHistoryDetail.GetInfo.ViewModel) {
        let history = viewModel.history
        
        overviewView.serverLabel.value = history.request.server
        overviewView.uriLabel.value = "\(history.request.method.uppercased()) \(history.request.path)"
        overviewView.usingSSL.value = "\(history.request.server.hasPrefix("https://"))"
        overviewView.durationLabel.value = "\(history.endTime.since(history.startTime, in: .second))s"
        requestView.text = history.curl ?? " - "
        responseView.text = history.response ?? " - "
        
        if let httpStatus = history.httpStatus {
            overviewView.responseCode.value = "\(httpStatus)"
        } else {
            overviewView.responseCode.value = " - "
        }
    }
}
