//
//  RequestHistoryDetailViewController+DisplayLogic.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//

import UIKit

protocol RequestHistoryDetailDisplayLogic: AnyObject {
    func presentDetail(viewModel: RequestHistoryDetail.GetInfo.ViewModel)
    func share(viewModel: RequestHistoryDetail.Share.ViewModel)
}

extension RequestHistoryDetailViewController: RequestHistoryDetailDisplayLogic {
    func presentDetail(viewModel: RequestHistoryDetail.GetInfo.ViewModel) {
        contentView.overviewView.configure(with: RequestHistoryDetailOverviewView.Content(
            uri: viewModel.uri,
            duration: viewModel.duration,
            statusCode: viewModel.httpStatus,
            usingSSL: viewModel.isUsingSSL,
            server: viewModel.server))

        contentView.requestView.configure(with: RequestHistoryDetailRequestView.Content(
            curl: viewModel.curl,
            body: viewModel.body))

        contentView.responseView.configure(with: RequestHistoryDetailResponseView.Content(
            httpStatus: viewModel.httpStatus,
            response: viewModel.response,
            errorDescription: viewModel.errorDescription))
    }

    func share(viewModel: RequestHistoryDetail.Share.ViewModel) {
        let activityViewController = UIActivityViewController(activityItems: [viewModel.shareMessage], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}
