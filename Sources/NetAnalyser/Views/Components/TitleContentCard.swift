//
//  TitleContentCard.swift
//  
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit
import SnapKit

class TitleContentCard: BaseCustomView {

    // MARK: Views
    private lazy var titleLabel = UILabel() <-< {
        $0.textColor = .titleColor
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.numberOfLines = 0
    }

    private lazy var contentLabel = UIPaddedLabel() <-< {
        $0.contentInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        $0.textColor = .bodyColor
        $0.backgroundColor = .contentBackgroundColor
        $0.font = UIFont.preferredFont(forTextStyle: .body)
        $0.numberOfLines = 0
    }

    private lazy var copyButton = CopyButton() <-< {
        $0.tintColor = .titleColor
        $0.addTarget(self, action: #selector(copyContent(_:)), for: .touchUpInside)
    }

    convenience init(title: String?, content: String?, canCopy: Bool = false) {
        self.init()
        configure(title: title, content: content, canCopy: canCopy)
    }

    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        layer.cornerRadius = 5
        clipsToBounds = true

        addSubview(copyButton)
        copyButton.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(18)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
            make.trailing.equalTo(copyButton.snp.leading).offset(8)
        }

        addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }

    func configure(title: String?, content: String?, canCopy: Bool = false) {
        titleLabel.text = title
        contentLabel.text = content
        copyButton.isHidden = !canCopy
    }

    @objc
    private func copyContent(_ sender: UIButton) {
        UIPasteboard.general.string = contentLabel.text
    }
}
