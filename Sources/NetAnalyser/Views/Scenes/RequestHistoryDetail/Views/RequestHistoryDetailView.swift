//
//  RequestHistoryDetailView.swift
//  NetAnalyser
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit


class RequestHistoryDetailView: BaseCustomView {
        
    //MARK: Views
    lazy var contentSegmentedControl = UISegmentedControl(items: ["Overview", "Request", "Response"]) <-< {
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(didChangeContentSegmentedControl(_:)), for: .valueChanged)
    }

    lazy var overviewView = RequestHistoryDetailOverviewView()
    lazy var requestView = RequestHistoryDetailRequestView()
    lazy var responseView = RequestHistoryDetailResponseView()
    
    private var contentStack: UIStackView = .init()
    
    private var contentStackLeftConstraint: NSLayoutConstraint?

    override func setupUI() {
        super.setupUI()
        clipsToBounds = true

        viewCodeAddSubView(contentSegmentedControl)
        viewCodeAddSubView(contentStack)

        contentStack.distribution = .fillEqually
        contentStack.addArrangedSubview(overviewView)
        contentStack.addArrangedSubview(requestView)
        contentStack.addArrangedSubview(responseView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let layoutGuide = safeAreaLayoutGuide
        
        contentStackLeftConstraint = contentStack.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor)
        
        NSLayoutConstraint.activate([
            contentSegmentedControl.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 8),
            contentSegmentedControl.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -8),
            contentSegmentedControl.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 8),
            
            contentStack.topAnchor.constraint(equalTo: contentSegmentedControl.bottomAnchor, constant: 8),
            contentStack.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 16),
            contentStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: CGFloat(contentStack.arrangedSubviews.count)),
            contentStackLeftConstraint!
        ])
    }

    @objc
    private func didChangeContentSegmentedControl(_ sender: UISegmentedControl) {
        let offset = CGFloat(sender.selectedSegmentIndex) * bounds.width * -1
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            self?.contentStackLeftConstraint?.constant = offset
            self?.layoutIfNeeded()
        })
    }
}
