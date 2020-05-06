//
//  Also.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation

infix operator <-< : AssignmentPrecedence

@discardableResult
public func <-<<T: AnyObject>(left: T, right: (T) -> Void) -> T {
    right(left)
    return left
}
