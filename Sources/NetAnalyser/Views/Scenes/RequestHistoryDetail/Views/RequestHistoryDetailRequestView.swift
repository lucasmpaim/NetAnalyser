//
//  RequestHistoryDetailRequestView.swift
//  NetAnalyser
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit
import SnapKit

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

    override func setupUI() {
        super.setupUI()
        backgroundColor = .backgroundColor

        let scrollView = UIScrollView()
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }

    func configure(with content: Content) {
        contentStackView.arrangedSubviews.forEach(contentStackView.removeArrangedSubview(_:))

        contentStackView.addArrangedSubview(TitleContentCard(title: "CURL", content: content.curl, canCopy: true))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Body", content: content.body, canCopy: true))
    }
}
