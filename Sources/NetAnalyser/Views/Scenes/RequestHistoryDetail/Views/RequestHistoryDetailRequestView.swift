//
//  RequestHistoryDetailRequestView.swift
//  NetAnalyser
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit


class RequestHistoryDetailRequestView: BaseCustomView {
    struct Content {
        let curl: String?
        let body: String?
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

        contentStackView.addArrangedSubview(TitleContentCard(title: "CURL", content: content.curl, canCopy: true))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Body", content: content.body, canCopy: true))
    }
}
