//
//  OperatorsTests.swift
//  NetAnalyser_Tests
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import NetAnalyser


class OperatorsTest: QuickSpec {
    
    class ObjectSpy {
        var called = false
    }
    
    override func spec() {
        describe("Operator Tests") {
            
            it("Also Called") {
                let spy = ObjectSpy()
                spy <-< {
                    $0.called = true
                }
                expect(spy.called).to(beTrue())
            }
            
            it("Check Interval") {
                expect(0..<3 ~~ 2).to(beTrue())
                expect(2 ~~ 0..<3).to(beTrue())
                
                expect(0...3 ~~ 50).to(beFalse())
                expect(50 ~~ 0...3).to(beFalse())
            }
        }
    }
    
}

