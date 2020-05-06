//
//  BaseViewControllerTests.swift
//  NetAnalyser_Tests
//
//  Created by Lucas Paim on 06/05/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import NetAnalyser


class BaseViewControllerTests: QuickSpec {
    
    class ViewControllerSpy : BaseViewController {
        var setupCalled = false
        
        override func setupUI() {
            super.setupUI()
            setupCalled = true
        }
    }
    
    override func spec() {
        describe("Operator Tests") {
            
            it("Setup Called") {
                let spy = ViewControllerSpy()
                spy.viewDidLoad()
                expect(spy.setupCalled).to(beTrue())
            }
            
        }
    }
    
}
