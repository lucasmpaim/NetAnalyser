//
//  RequestHistoryDetailViewController.swift
//  Pods
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit


protocol RequestHistoryDetailDisplayLogic: class {
    func presentDetail(viewModel: RequestHistoryDetail.GetInfo.ViewModel)
}

class RequestHistoryDetailViewController: BaseViewController {

    // Var's
    var interactor: RequestHistoryDetailBusinessLogic?
    var router: (NSObjectProtocol & RequestHistoryDetailRoutingLogic & RequestHistoryDetailDataPassing)?

    //MARK: Views
    lazy var segmentControl: UISegmentedControl = {
        UISegmentedControl(items: ["Overview", "Request", "Response"]) <-< {
            $0.selectedSegmentIndex = 0
            $0.addTarget(self, action: #selector(updateStackPosition), for: .valueChanged)
        }
    }()
    
    lazy var shareButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .action,
                        target: self,
                        action: #selector(shareRequest))
    }()
    
    lazy var overviewView: RequestOverviewView = {
        RequestOverviewView()
    }()
    
    lazy var requestView: UITextView = {
        UITextView() <-< {
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = false
            $0.textColor = .titleColor
            $0.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
    }()
    
    lazy var responseView: UITextView = {
        UITextView() <-< {
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = false
            $0.textColor = .titleColor
            $0.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
    }()
    
    lazy var stackView: UIStackView = {
        UIStackView() <-< {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.addArrangedSubview(overviewView)
            $0.addArrangedSubview(requestView)
            $0.addArrangedSubview(responseView)
        }
    }()
    
    var stackLeadingConstraint: Constraint?
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
        interactor?.getDetail(request: RequestHistoryDetail.GetInfo.Request())
    }
    
    override func setupUI() {
        self.navigationItem.rightBarButtonItems = [shareButton]
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(20)
            make.top.equalTo(view.layoutMarginsGuide.snp.topMargin).inset(20)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
            stackLeadingConstraint = make.leading.equalToSuperview().constraint
            make.width.equalToSuperview().multipliedBy(stackView.arrangedSubviews.count)
        }
    }

    // Appear

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func shareRequest() {
        let textShare: [Any] = [ requestView.text ]
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }

    @objc func updateStackPosition() {
        let offset = UIScreen.main.bounds.width * CGFloat(segmentControl.selectedSegmentIndex)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut,
                       animations: { [weak self] in
                        
//            self?.stackView.snp.updateConstraints { make in
//                make.trailing.equalToSuperview().inset(offset)
//            }
            self?.stackLeadingConstraint?.update(offset: -offset)
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
}
