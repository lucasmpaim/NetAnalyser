//
//  RequestHistoryDetailOverviewView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import UIKit
import SnapKit

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

        contentStackView.addArrangedSubview(TitleContentCard(title: "URI", content: content.uri, canCopy: true))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Duration", content: content.duration))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Status Code", content: content.statusCode))
        contentStackView.addArrangedSubview(TitleContentCard(title: "SSL", content: content.usingSSL))
        contentStackView.addArrangedSubview(TitleContentCard(title: "Server", content: content.server, canCopy: true))
    }
}
