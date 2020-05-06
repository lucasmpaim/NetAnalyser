//
//  Extensions.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 06/05/20.
//

import Foundation

extension String {
    var utf8String : UnsafePointer<Int8>? {
        (self as NSString).utf8String
    }
}

extension UnsafePointer where Pointee == UInt8 {
    var safeString: String {
        String(cString: self)
    }
}
