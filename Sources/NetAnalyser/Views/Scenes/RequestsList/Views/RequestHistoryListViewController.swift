//
//  RequestHistoryListViewController.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


protocol RequestHistoryListDisplayLogic: AnyObject {
    func displayAllHistory(viewModel: RequestHistoryList.GetHistory.ViewModel.Success)
    func displayCleanHistory(response: RequestHistoryList.CleanHistory.ViewModel.Success)
}

public class RequestHistoryListViewController: BaseViewController {

    var allItems: [RequestHistory] = []
    
    // Var's
    var interactor: RequestHistoryListBusinessLogic?
    var router: (NSObjectProtocol & RequestHistoryListRoutingLogic & RequestHistoryListDataPassing)?

    //MARK: Views
    lazy var tableView: UITableView = {
        UITableView() <-< {
            $0.backgroundColor = UIColor.backgroundColor
            $0.register(RequestListCell.self,
                        forCellReuseIdentifier: RequestListCell.reuseIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = 80
        }
    }()
    
    lazy var cleanButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .trash,
                        target: self,
                        action: #selector(didCleanTap))
    }()
    
    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // Load
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Request History"
        interactor?.fetchAllHistory(request: RequestHistoryList.GetHistory.Request())
    }

    override func setupUI() {
        view.viewCodeAddSubView(tableView)
        navigationItem.rightBarButtonItems = [cleanButton]
        setupConstraints()
    }
    
    func setupConstraints() {
        let layoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate(
            tableView.edgeArchors(equalTo: layoutGuide)
        )
    }
    
    @objc func didCleanTap() {
        interactor?.cleanHistory(request: RequestHistoryList.CleanHistory.Request())
    }

}
