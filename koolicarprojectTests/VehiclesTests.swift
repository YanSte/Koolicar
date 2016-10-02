//
//  koolicarprojectTests.swift
//  koolicarprojectTests
//
//  Created by Stephan Yannick on 29/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import XCTest
@testable import koolicarproject

class VehiclesTests: XCTestCase {
    
    var expectation:XCTestExpectation?
    
    func testGetCars() {
        
        expectation = expectation(description: "TestGetVehicul")
        
        KPGenericWorker.resquest(method: .get, service: WSConfig.Cars(additional: "test.json")) {
            result in
            switch (result) {
            case .success(_):
                self.expectation?.fulfill()
                XCTAssert(true)
                break
            case .failure(_):
                self.expectation?.fulfill()
                XCTAssert(false)
                break
            }
        }
        waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    func testParseCars() {
        
        expectation = expectation(description: "TestParseVehicul")
        
        KPGenericWorker.resquest(method: .get, service: WSConfig.Cars(additional: "test.json")) {
            result in
            switch (result) {
            case .success(let result):
                guard let vehiculs = result["vehicles"] as? [[String:Any]] else {
                    XCTAssert(false)
                    return
                }
                self.expectation?.fulfill()
                for vehicul in vehiculs {
                    let vehiculs = VehicleModel(JSON: vehicul)
                    XCTAssert(vehiculs != nil)
                    XCTAssert(vehiculs?.id != nil)
                    XCTAssert(vehiculs?.addressId != nil)
                    XCTAssert(vehiculs?.year != nil)
                    XCTAssert(vehiculs?.doorsCount != nil)
                    XCTAssert(vehiculs?.placesCount != nil)
                    XCTAssert(vehiculs?.fuelTypeCd != nil)
                    XCTAssert(vehiculs?.gearsTypeCd != nil)
                    XCTAssert(vehiculs?.vehicle_model != nil)
                    XCTAssert(vehiculs?.brand != nil)
                    XCTAssert(vehiculs?.category != nil)
                    XCTAssert(vehiculs?.thumbnailUrl != nil)
                    XCTAssert(vehiculs?.latitude != nil)
                    XCTAssert(vehiculs?.longitude != nil)
                }
                break
            case .failure(_):
                self.expectation?.fulfill()
                XCTAssert(false)
                break
            }
        }
        waitForExpectations(timeout: 20.0, handler:nil)
        
    }
}
