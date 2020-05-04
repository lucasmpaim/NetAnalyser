//
//  Request.swift
//  FBSnapshotTestCase
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public struct Request {
    public let method: String
    public let server: String
    public let path: String
    public let id: Int?
    
    public init(method: String, server: String, path: String) {
        self.method = method
        self.server = server
        self.path = path
        self.id = nil
    }
    
    internal init(method: String, server: String,
                              path: String, id: Int) {
        self.method = method
        self.server = server
        self.path = path
        self.id = id
    }
    
}
