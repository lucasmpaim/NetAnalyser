//
//  BaseCustomView.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 07/05/20.
//

import Foundation
import UIKit

class BaseCustomView: UIView {
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() { }

}
