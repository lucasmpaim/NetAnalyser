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
    func share(response: RequestHistoryDetail.Share.Response)
}

class RequestHistoryDetailPresenter: RequestHistoryDetailPresentationLogic {

    // Var's
    weak var viewController: RequestHistoryDetailDisplayLogic?

    func presentDetail(response: RequestHistoryDetail.GetInfo.Response) {
        let elapsedTime = Int(response.history.endTime.timeIntervalSince(response.history.startTime))

        let httpStatus: String
        if let code = response.history.httpStatus {
            httpStatus = "\(code)"
        } else {
            httpStatus = "-"
        }

        let isUsingSSL = response.history.request.server.hasPrefix("https://")

        let viewModel = RequestHistoryDetail.GetInfo.ViewModel(
            curl: response.history.curl ?? "-",
            uri: "\(response.history.request.method.uppercased()) \(response.history.request.path)",
            method: response.history.request.method,
            server: response.history.request.server,
            path: response.history.request.path,
            startTime: response.history.startTime.toString(),
            endTime: response.history.endTime.toString(),
            duration: "\(elapsedTime) ms",
            body: response.history.body?.jsonPrettyPrinted ?? "",
            isUsingSSL: "\(isUsingSSL)".capitalized,
            httpStatus: httpStatus,
            response: response.history.response?.jsonPrettyPrinted ?? "",
            errorDescription: response.history.errorDescription ?? "-")
        viewController?.presentDetail(viewModel: viewModel)
    }

    func share(response: RequestHistoryDetail.Share.Response) {
        let httpStatus: String
        if let code = response.history.httpStatus {
            httpStatus = "\(code)"
        } else {
            httpStatus = "-"
        }

        var report = "~ Network Analyser report: ~\n\n"
        report += "• URI: \(response.history.request.method.uppercased()) \(response.history.request.path)\n"
        report += "• HTTP Status: \(httpStatus)\n"
        report += "• StartTime: \(response.history.startTime.toString())\n"
        report += "• EndTime: \(response.history.endTime.toString())\n"
        report += "\n"
        report += "• CURL:\n"
        report += "\(response.history.curl ?? "")\n\n"
        report += "• Body:\n"
        report += response.history.body?.jsonPrettyPrinted ?? ""
        report += "\n\n"
        report += "• Response:\n"
        report += response.history.response?.jsonPrettyPrinted ?? ""

        viewController?.share(viewModel: RequestHistoryDetail.Share.ViewModel(shareMessage: report))
    }
}
