//
//  UIPaddedLabel.swift
//  
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit

class UIPaddedLabel: UILabel {
    var contentInsets: UIEdgeInsets = .zero {
        didSet {
            super.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        let preferedSize = super.intrinsicContentSize
        return CGSize(
            width: preferedSize.width + contentInsets.left + contentInsets.right,
            height: preferedSize.height + contentInsets.top + contentInsets.bottom)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInsets))
    }
}
