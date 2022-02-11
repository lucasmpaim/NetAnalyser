//
//  DetailView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 07/05/20.
//

import UIKit

class DetailView: BaseCustomView {
    
    //MARK: Views
    lazy var titleLabel: UILabel = {
        UILabel() <-< {
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textColor = .titleColor
            $0.text = " - "
            $0.numberOfLines = 1
            $0.textAlignment = .natural
        }
    }()
    
    lazy var descriptionLabel: UILabel = {
        UILabel() <-< {
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textColor = .titleColor
            $0.text = " - "
            $0.numberOfLines = 0
            $0.textAlignment = .right
        }
    }()
    
    lazy var stackView: UIStackView = {
        UIStackView() <-< {
            $0.axis = .horizontal
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(descriptionLabel)
            $0.distribution = .fill
            $0.spacing = 20
        }
    }()
    
    var value: String? {
        get { descriptionLabel.text }
        set { descriptionLabel.text = newValue }
    }
    
    override func setupUI() {
        viewCodeAddSubView(stackView)
        NSLayoutConstraint.activate(
            stackView.edgeArchors(equalTo: self)
        )
    }
    
}
