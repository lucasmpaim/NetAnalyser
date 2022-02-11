//
//  ConstraintsExtension.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 11/02/22.
//

import UIKit


protocol HasArchors {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}


extension UILayoutGuide: HasArchors { }

extension UIView: HasArchors { }

extension UIView {
    /**
     Syntax sugar to create top/leading/trailing/bottom constraints
     equals to another view
     */
    func edgeArchors(equalTo other: HasArchors) -> [NSLayoutConstraint] {
        return [
            self.topAnchor.constraint(equalTo: other.topAnchor),
            self.leadingAnchor.constraint(equalTo: other.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: other.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: other.bottomAnchor)
        ]
    }
}
