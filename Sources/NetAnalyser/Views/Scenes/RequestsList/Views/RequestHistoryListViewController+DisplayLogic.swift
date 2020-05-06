//
//  RequestHistoryListViewController+DisplayLogic.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension RequestHistoryListViewController: RequestHistoryListDisplayLogic {
    
    func displayAllHistory(viewModel: RequestHistoryList.GetHistory.ViewModel.Success) {
        self.allItems = viewModel.data
        tableView.reloadData()
    }
    
    func displayCleanHistory(response: RequestHistoryList.CleanHistory.ViewModel.Success) {
        self.allItems = []
        tableView.reloadData()
    }

}
