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

    var jsonPrettyPrinted: String {
        guard
            let bodyData = self.data(using: .utf8),
            let originalEncoded = try? JSONSerialization.jsonObject(with: bodyData, options: .mutableContainers),
            let prettyEncoded = try? JSONSerialization.data(withJSONObject: originalEncoded, options: .prettyPrinted)
        else { return self }

        return String(decoding: prettyEncoded, as: UTF8.self)
    }
}

extension UnsafePointer where Pointee == UInt8 {
    var safeString: String {
        String(cString: self)
    }
}
