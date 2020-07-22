//
//  RequestHistoryDetailViewController.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//

import UIKit
import SnapKit

class RequestHistoryDetailViewController: BaseViewController {

    // Var's
    var interactor: RequestHistoryDetailBusinessLogic?
    var router: (NSObjectProtocol & RequestHistoryDetailRoutingLogic & RequestHistoryDetailDataPassing)?
    var contentView = RequestHistoryDetailView()

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
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(_:)))
        interactor?.getDetail(request: RequestHistoryDetail.GetInfo.Request())
    }

    override func loadView() {
        self.view = contentView
    }

    @objc
    private func share(_ sender: UIBarButtonItem) {
        interactor?.share(request: RequestHistoryDetail.Share.Request())
    }
}
