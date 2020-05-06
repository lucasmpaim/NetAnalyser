//
//  RequestListCell.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation
import UIKit
import AFDateHelper


class RequestListCell: UITableViewCell {
    
    static let reuseIdentifier = "RequestListCell"
    let kMargin = 20
    
    var successColor: UIColor { #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) }
    var errorColor : UIColor { #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) }
    
    //MARK: Views
    lazy var responseStatusCodeLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 1
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
    }()
    
    lazy var pathLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 0
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
    }()
    
    lazy var serverLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 1
            $0.textColor = .red
            $0.font = UIFont.systemFont(ofSize: 12)
        }
    }()
    
    lazy var hourLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 1
            $0.textColor = #colorLiteral(red: 0.6117647059, green: 0.6039215686, blue: 0.6117647059, alpha: 1)
            $0.font = UIFont.systemFont(ofSize: 12)
        }
    }()
    
    lazy var durationLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 1
            $0.textColor = #colorLiteral(red: 0.6117647059, green: 0.6039215686, blue: 0.6117647059, alpha: 1)
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textAlignment = .right
        }
    }()
    
    lazy var bottomStack: UIStackView = {
        UIStackView(arrangedSubviews: [hourLabel, durationLabel]) <-< {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 10
        }
    }()
    
    //MARK: Initializers
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        selectionStyle = .gray
        addSubview(responseStatusCodeLabel)
        responseStatusCodeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(kMargin)
            make.top.equalToSuperview().inset(kMargin)
            make.width.equalTo(40)
        }
        
        addSubview(pathLabel)
        pathLabel.snp.makeConstraints { make in
            make.leading.equalTo(responseStatusCodeLabel.snp.trailing).offset(kMargin)
            make.trailing.equalToSuperview().inset(kMargin)
            make.top.equalTo(responseStatusCodeLabel.snp.top)
        }

        addSubview(serverLabel)
        serverLabel.snp.makeConstraints { make in
            make.leading.equalTo(responseStatusCodeLabel.snp.trailing).offset(kMargin)
            make.trailing.equalToSuperview().inset(kMargin)
            make.top.equalTo(pathLabel.snp.bottom)
        }

        addSubview(bottomStack)
        bottomStack.snp.makeConstraints { make in
            make.top.equalTo(serverLabel.snp.bottom)
            make.leading.equalTo(pathLabel.snp.leading)
            make.trailing.equalTo(pathLabel.snp.trailing)
            make.bottom.equalToSuperview().inset(kMargin)
        }
    }
    
    func populateFor(history: RequestHistory) {
        responseStatusCodeLabel.text = "\(history.httpStatus)"
        responseStatusCodeLabel.textColor = (history.httpStatus ~~ 200..<300) ? successColor : errorColor
        pathLabel.text = "\(history.request.method.uppercased()) \(history.request.path)"
        serverLabel.text = history.request.server
        serverLabel.textColor = history.request.server.hasPrefix("https://") ? successColor : errorColor
        hourLabel.text = history.startTime.toStringWithRelativeTime()
        durationLabel.text = "\(history.endTime.since(history.startTime, in: .second))s"
    }
}
