//
//  RequestListCell.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation
import UIKit
#if COCOAPODS
    import AFDateHelper
#else
    import DateHelper
#endif

class RequestListCell: UITableViewCell {
    
    static let reuseIdentifier = "RequestListCell"
    let kMargin = 20
    
    
    //MARK: Views
    lazy var responseStatusCodeLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 1
            $0.textColor = .titleColor
            $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
    }()
    
    lazy var pathLabel: UILabel = {
        UILabel() <-< {
            $0.numberOfLines = 0
            $0.textColor = .titleColor
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
        if let httpStatus = history.httpStatus {
            responseStatusCodeLabel.text = "\(httpStatus)"
        } else {
            responseStatusCodeLabel.text = " - "
        }
        
        let difference = Int(history.endTime.timeIntervalSince(history.startTime))
        
        responseStatusCodeLabel.textColor = (history.httpStatus ~~ 200..<300) ? .successColor : .errorColor
        pathLabel.text = "\(history.request.method.uppercased()) \(history.request.path)"
        serverLabel.text = history.request.server
        serverLabel.textColor = history.request.server.hasPrefix("https://") ? .successColor : .errorColor
        hourLabel.text = history.startTime.toStringWithRelativeTime()
        durationLabel.text = "\(difference)ms"
    }
}
