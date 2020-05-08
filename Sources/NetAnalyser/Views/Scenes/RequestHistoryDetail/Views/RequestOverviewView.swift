//
//  RequestOverviewView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation
import UIKit
import SnapKit


class RequestOverviewView: BaseCustomView {
        
    //MARK: Views
    lazy var uriLabel: DetailView = {
        DetailView() <-< {
            $0.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.titleLabel.text = "URI"
        }
    }()
    
    lazy var durationLabel: DetailView = {
        DetailView() <-< {
            $0.titleLabel.text = "Duration"
        }
    }()
    
    lazy var responseCode: DetailView = {
        DetailView() <-< {
            $0.titleLabel.text = "Response Status"
        }
    }()
    
    lazy var usingSSL: DetailView = {
        DetailView() <-< {
            $0.titleLabel.text = "SSL"
        }
    }()
    
    lazy var serverLabel: DetailView = {
        DetailView() <-< {
            $0.titleLabel.text = "Server"
        }
    }()
    
    lazy var stackView: UIStackView = {
        UIStackView() <-< {
            $0.axis = .vertical
            $0.addArrangedSubview(serverLabel)
            $0.addArrangedSubview(uriLabel)
            $0.addArrangedSubview(durationLabel)
            $0.addArrangedSubview(responseCode)
            $0.addArrangedSubview(usingSSL)
        }
    }()
    
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .backgroundColor
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.leading.equalToSuperview().inset(20)
        }
    }
    
}
