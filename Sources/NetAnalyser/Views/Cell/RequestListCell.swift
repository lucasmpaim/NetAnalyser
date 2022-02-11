//
//  RequestListCell.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation
import UIKit


class RequestListCell: UITableViewCell {
    
    static let reuseIdentifier = "RequestListCell"
    let kMargin: CGFloat = 20
    
    
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
        viewCodeAddSubView(responseStatusCodeLabel)
        viewCodeAddSubView(pathLabel)
        viewCodeAddSubView(serverLabel)
        viewCodeAddSubView(bottomStack)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            responseStatusCodeLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: kMargin),
            responseStatusCodeLabel.topAnchor.constraint(
                equalTo: self.topAnchor, constant: kMargin),
            responseStatusCodeLabel.widthAnchor.constraint(equalToConstant: 40),

            pathLabel.leadingAnchor.constraint(
                equalTo: responseStatusCodeLabel.trailingAnchor, constant: 8),
            pathLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: kMargin),
            pathLabel.topAnchor.constraint(equalTo: responseStatusCodeLabel.topAnchor),

            serverLabel.leadingAnchor.constraint(equalTo: pathLabel.leadingAnchor),
            serverLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: kMargin),
            serverLabel.topAnchor.constraint(equalTo: pathLabel.bottomAnchor),
            
            bottomStack.topAnchor.constraint(equalTo: serverLabel.bottomAnchor),
            bottomStack.leadingAnchor.constraint(equalTo: pathLabel.leadingAnchor),
            bottomStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -kMargin),
            bottomStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -kMargin)
        ])
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
        hourLabel.text = history.startTime.toString()
        durationLabel.text = "\(difference)ms"
    }
}
