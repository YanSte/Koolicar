//
//  koolicarprojectTests.swift
//  koolicarprojectTests
//
//  Created by Stephan Yannick on 29/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import XCTest
@testable import koolicarproject

class koolicarprojectTests: XCTestCase {
    
    var expectation:XCTestExpectation?
    
    func testExample() {
        
       expectation = expectation(description: "ok")
        
        KPGenericWorker.resquest(method: .get, service: WSConfig.Cars(additional: "test.json")) {
            result in
            switch (result) {
            case .success(let result):
                self.expectation?.fulfill()
                XCTAssert(true)
                break
            case let .failure(error):
                self.expectation?.fulfill()
                XCTAssert(false)
                break
            } 
        }
        waitForExpectations(timeout: 20.0, handler:nil)
    }
    
}
