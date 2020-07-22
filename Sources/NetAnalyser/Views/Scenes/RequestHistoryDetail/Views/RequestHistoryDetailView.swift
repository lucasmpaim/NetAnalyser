//
//  RequestHistoryDetailView.swift
//  NetAnalyser
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit
import SnapKit

class RequestHistoryDetailView: BaseCustomView {
        
    //MARK: Views
    lazy var contentSegmentedControl = UISegmentedControl(items: ["Overview", "Request", "Response"]) <-< {
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(didChangeContentSegmentedControl(_:)), for: .valueChanged)
    }

    lazy var overviewView = RequestHistoryDetailOverviewView()
    lazy var requestView = RequestHistoryDetailRequestView()
    lazy var responseView = RequestHistoryDetailResponseView()
    private var contentStackLeftConstraint: Constraint?

    override func setupUI() {
        super.setupUI()
        clipsToBounds = true

        addSubview(contentSegmentedControl)
        contentSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide.snp.topMargin).inset(8)
            make.trailing.leading.equalToSuperview().inset(8)
        }

        let contentStack = UIStackView()
        contentStack.distribution = .fillEqually
        contentStack.addArrangedSubview(overviewView)
        contentStack.addArrangedSubview(requestView)
        contentStack.addArrangedSubview(responseView)
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.top.equalTo(contentSegmentedControl.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(16)
            make.width.equalToSuperview().multipliedBy(contentStack.arrangedSubviews.count)
            contentStackLeftConstraint = make.left.equalToSuperview().constraint
        }
    }

    @objc
    private func didChangeContentSegmentedControl(_ sender: UISegmentedControl) {
        let offset = CGFloat(sender.selectedSegmentIndex) * bounds.width * -1
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            self?.contentStackLeftConstraint?.update(offset: offset)
            self?.layoutIfNeeded()
        })
    }
}
