//
//  RequestOverviewView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation
import UIKit


class RequestOverviewView: UIView {
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    //MARK: Views
    
    lazy var pathLabel: UILabel = {
        UILabel() <-< {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
    }()
    
    
    func setupUI() {
        
    }
}
