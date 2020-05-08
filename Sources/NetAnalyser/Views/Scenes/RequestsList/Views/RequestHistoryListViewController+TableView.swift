//
//  RequestHistoryListViewController+TableView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation
import UIKit


extension RequestHistoryListViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RequestListCell.reuseIdentifier) as? RequestListCell ??
            RequestListCell(style: .default, reuseIdentifier: RequestListCell.reuseIdentifier)
        let item = allItems[indexPath.row]
        cell.populateFor(history: item)
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        router?.routeToRequestHistoryDetail(history: allItems[indexPath.row])
    }
}
