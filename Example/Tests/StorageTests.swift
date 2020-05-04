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
        }
    }
    
}
