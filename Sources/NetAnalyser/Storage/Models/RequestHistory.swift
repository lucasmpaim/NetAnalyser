//
//  RequestHistory'.swift
//  NetAnalyser
//
//  Created by Lucas Paim on 04/05/20.
//

import Foundation


public struct RequestHistory {

    let startTime: Date
    let endTime: Date
    let httpStatus: Int
    
    let body: String?
    let response: String?
    let errorDescription: String?
    let curl: String?
    
    let request: Request
    
    public init(request: Request, startTime: Date, endTime: Date, httpStatus: Int,
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
    }
    
}
