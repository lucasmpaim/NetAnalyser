//
//  RequestHistory'.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public struct RequestHistory {

    public let startTime: Date
    public let endTime: Date
    public let httpStatus: Int?
    
    public let body: String?
    public let response: String?
    public let errorDescription: String?
    public let curl: String?
    
    public let request: Request
    public let id: Int?

    public init(request: Request, startTime: Date, endTime: Date, httpStatus: Int?,
                body: String?, response: String?,
                errorDescription: String?, curl: String?) {
        self.startTime = startTime
        self.endTime = endTime
        self.httpStatus = httpStatus
        self.body = body
        self.response = response
        self.errorDescription = errorDescription
        self.curl = curl
        self.request = request
        self.id = nil
    }
    
    init(request: Request, startTime: Date, endTime: Date, httpStatus: Int?,
                body: String?, response: String?,
                errorDescription: String?, curl: String?, id: Int) {
        self.startTime = startTime
        self.endTime = endTime
        self.httpStatus = httpStatus
        self.body = body
        self.response = response
        self.errorDescription = errorDescription
        self.curl = curl
        self.request = request
        self.id = id
    }
    
}
