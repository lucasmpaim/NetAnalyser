//
//  TitleContentCard.swift
//  
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit


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
        backgroundColor = .cardBackgroundColor
        layer.cornerRadius = 5
        clipsToBounds = true

        viewCodeAddSubView(copyButton)
        viewCodeAddSubView(titleLabel)
        viewCodeAddSubView(contentLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            copyButton.widthAnchor.constraint(equalToConstant: 16),
            copyButton.heightAnchor.constraint(equalToConstant: 18),
            copyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            copyButton.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: copyButton.leadingAnchor, constant: -8),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }

    func configure(
        title: String?,
        content: String?,
        canCopy: Bool = false
    ) {
        titleLabel.text = title
        contentLabel.text = content
        copyButton.isHidden = !canCopy
    }

    @objc
    private func copyContent(_ sender: UIButton) {
        UIPasteboard.general.string = contentLabel.text
    }
}
