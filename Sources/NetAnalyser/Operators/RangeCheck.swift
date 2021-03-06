//
//  RangeCheck.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation

infix operator ~~ : AssignmentPrecedence

public func ~~<T: Equatable>(left: T?, right: Range<T>) -> Bool {
    guard let leftArgument = left else { return false }
    return right.contains(leftArgument)
}

public func ~~<T: Equatable>(left: Range<T>, right: T?) -> Bool {
    right ~~ left
}


public func ~~<T: Equatable>(left: T?, right: ClosedRange<T>) -> Bool {
    guard let leftArgument = left else { return false }
    return right.contains(leftArgument)
}

public func ~~<T: Equatable>(left: ClosedRange<T>, right: T?) -> Bool {
    right ~~ left
}
