//
//  RequestHistoryDetailOverviewView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import UIKit

class RequestHistoryDetailOverviewView: BaseCustomView {
    struct Content {
        let uri: String?
        let duration: String?
        let statusCode: String?
        let usingSSL: String?
        let server: String?
    }

    private lazy var contentStackView = UIStackView() <-< {
        $0.axis = .vertical
        $0.spacing = 8
        $0.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    private lazy var scrollView: UIScrollView = .init()

    override func setupUI() {
        super.setupUI()
        backgroundColor = .backgroundColor
        viewCodeAddSubView(scrollView)
        scrollView.viewCodeAddSubView(contentStackView)
        setupConstraints()
    }
    
    func setupConstraints() {
        let layoutGuide = safeAreaLayoutGuide        
        NSLayoutConstraint.activate(
            scrollView.edgeArchors(equalTo: layoutGuide) +
            contentStackView.edgeArchors(equalTo: scrollView) +
            [
                scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
                scrollView.heightAnchor.constraint(equalTo: heightAnchor),
                scrollView.widthAnchor.constraint(equalTo: widthAnchor),
                contentStackView.widthAnchor.constraint(equalTo: self.widthAnchor)
            ]
        )
    }

    func configure(with content: Content) {
        contentStackView.arrangedSubviews.forEach(contentStackView.removeArrangedSubview(_:))

        contentStackView.addArrangedSubview(TitleContentCard(title: "URI", content: content.uri, canCopy: true))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Duration", content: content.duration))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Status Code", content: content.statusCode))
        contentStackView.addArrangedSubview(TitleContentCard(title: "SSL", content: content.usingSSL))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Server", content: content.server, canCopy: true))
    }
}
