//
//  RequestHistoryDetailViewController.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RequestHistoryDetailDisplayLogic: class {

}

class RequestHistoryDetailViewController: BaseViewController {

    // Var's
    var interactor: RequestHistoryDetailBusinessLogic?
    var router: (NSObjectProtocol & RequestHistoryDetailRoutingLogic & RequestHistoryDetailDataPassing)?

    //MARK: Views
    lazy var segmentControl: UISegmentedControl = {
        UISegmentedControl(items: ["Overview", "Request", "Response"]) <-< {
            $0.selectedSegmentIndex = 0
        }
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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(20)
            make.top.equalTo(view.layoutMarginsGuide.snp.topMargin).inset(20)
        }
    }

    // Appear

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}
