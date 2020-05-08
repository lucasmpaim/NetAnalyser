//
//  Colors.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 07/05/20.
//

import Foundation
import UIKit


extension UIColor {
    
    static func colorFactory(darkMode: UIColor, fallbackMode: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { mode -> UIColor in
                switch mode.userInterfaceStyle {
                case .dark:
                    return darkMode
                default:
                    return fallbackMode
                }
            }
        } else {
            return fallbackMode
        }
    }
    
    static let backgroundColor : UIColor = {
        colorFactory(darkMode: .black, fallbackMode: .white)
    }()
    
    static let titleColor : UIColor = {
        colorFactory(darkMode: .white, fallbackMode: .black)
    }()
    
    static let errorColor : UIColor = {
        colorFactory(darkMode: #colorLiteral(red: 1, green: 0.08500975764, blue: 0.07450980693, alpha: 1), fallbackMode: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    }()
    
    static let successColor : UIColor = {
        colorFactory(darkMode: #colorLiteral(red: 0.1960784346, green: 0.7473439537, blue: 0.1019607857, alpha: 1), fallbackMode: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))
    }()
    
}
