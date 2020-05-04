//
//  Request.swift
//  FBSnapshotTestCase
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public struct Request {
    let method: String
    let server: String
    let path: String
    
    public init(method: String, server: String, path: String) {
        self.method = method
        self.server = server
        self.path = path
    }
    
}
