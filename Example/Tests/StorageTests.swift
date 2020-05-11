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
                expect(try? SQLiteStorage.instance.createNetworkTables(
                    connection: SQLiteStorage.instance.openDatabaseConnection()
                )).to(beVoid())
            }
            
            it("Can save item and retrive item") {
                
                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    self.itemFactory(method: "POST", path: "/todos/1"))
                ).to(beVoid())
                
                expect(try? SQLiteStorage.instance.fetchAllHistory().first?
                    .request.server).to(equal("https://jsonplaceholder.typicode.com"))
                
                expect(try? SQLiteStorage.instance.fetchAllRequests().first?.server)
                    .to(equal("https://jsonplaceholder.typicode.com"))
            }
            
            it("Can add more requests") {
                
                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    self.itemFactory(method: "POST", path: "/todos/1")
                )).to(beVoid())

                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    self.itemFactory(method: "POST", path: "/todos/2")
                )).to(beVoid())
                
                
                expect(try? SQLiteStorage.instance.fetchAllRequests().count).to(beGreaterThan(1))
                
            }
            
            it("filter by request") {
                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    self.itemFactory(method: "POST", path: "/todos/1")
                )).to(beVoid())

                expect(try? SQLiteStorage.instance.saveRequestHistory(
                    self.itemFactory(method: "POST", path: "/todos/2")
                )).to(beVoid())
                
                guard let item = try? SQLiteStorage.instance.fetchAllRequests().first else {
                    fail("Don't return any value")
                    return
                }
                
                let filteredItems = (try? SQLiteStorage.instance.fetchHistoryFor(item.id!)) ?? []
                expect(
                    filteredItems.filter({ $0.request.id != item.id! }).count
                ).to(equal(0))
            }
            
            it("Can delete database") {
                expect(try? SQLiteStorage.instance.clear()).to(beVoid())
            }
            
        }
    }
    
    
    func itemFactory(method: String, path: String) -> RequestHistory {
        let request = Request(method: method,
                              server: "https://jsonplaceholder.typicode.com",
                              path: path)
        
        let item = RequestHistory(request: request,
                                  startTime: Date(),
                                  endTime: Date().addingTimeInterval(Double.random(in: 200 ..< 800)),
                                  httpStatus: 200,
                                  body: nil,
                                  response: "{'response': 'teste'}",
                                  errorDescription: nil, curl: "curl -X \(method) \"https://jsonplaceholder.typicode.com/\(path)\"")
        return item
    }
    
}
