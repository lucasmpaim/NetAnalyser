//
//  StorageTests.swift
//  NetAnalyser_Example
//
//  Created by Lucas Paim on 04/05/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import NetAnalyser


class StorageSpec: QuickSpec {
    
    override func spec() {
        describe("Storage Tests") {
            it("Can connect to database") {
                expect(try? SQLiteStorage.instance.openDatabaseConnection()).toNot(beNil())
            }
            it("Can create tables") {
                expect(try? SQLiteStorage.instance.createNetworkTables()).to(beVoid())
            }
            
            it("Can save item and retrive item") {
                let request = Request(method: "POST",
                                      server: "https://jsonplaceholder.typicode.com",
                                      path: "/todos/1")
                
                let item = RequestHistory(request: request,
                                          startTime: Date(),
                                          endTime: Date().addingTimeInterval(2000),
                                          httpStatus: 200,
                                          body: nil,
                                          response: "{'response': 'teste'}",
                                          errorDescription: nil, curl: "curl -X POST \"https://jsonplaceholder.typicode.com/todos/1\"")
                
                expect(try? SQLiteStorage.instance.createNetworkTables()).to(beVoid())
                
                expect(try? SQLiteStorage.instance.saveRequestHistory(item)).to(beVoid())
                
                expect(try? SQLiteStorage.instance.fetchAllHistory().first?
                    .request.server).to(equal("https://jsonplaceholder.typicode.com"))
                
                expect(try? SQLiteStorage.instance.fetchAllRequests().first?.server)
                    .to(equal("https://jsonplaceholder.typicode.com"))
            }
            
            it("Can add more requests") {
                let request = Request(method: "GET",
                                      server: "https://jsonplaceholder.typicode.com",
                                      path: "/todos/1")

                let request2 = Request(method: "GET",
                                       server: "https://jsonplaceholder.typicode.com",
                                       path: "/todos/2")
                
                expect(try? SQLiteStorage.instance.createNetworkTables()).to(beVoid())

                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    RequestHistory(request: request,
                                   startTime: Date(),
                                   endTime: Date().addingTimeInterval(2000),
                                   httpStatus: 200,
                                   body: nil,
                                   response: "{'response': 'teste'}",
                                   errorDescription: nil, curl: "curl -X GET \"https://jsonplaceholder.typicode.com/todos/1\"")
                )).to(beVoid())

                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    RequestHistory(request: request2,
                                   startTime: Date(),
                                   endTime: Date().addingTimeInterval(2000),
                                   httpStatus: 200,
                                   body: nil,
                                   response: "{'response': 'teste'}",
                                   errorDescription: nil, curl: "curl -X GET \"https://jsonplaceholder.typicode.com/todos/2\"")
                )).to(beVoid())
                
                expect(try? SQLiteStorage.instance.fetchAllRequests().count).to(beGreaterThan(1))
                
            }
            
        }
    }
    
}
