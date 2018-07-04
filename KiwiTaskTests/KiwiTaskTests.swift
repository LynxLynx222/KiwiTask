//
//  KiwiTaskTests.swift
//  KiwiTaskTests
//
//  Created by Ondrej Andrysek on 6/20/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import XCTest
@testable import KiwiTask

class KiwiTaskTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntTime(){
        let sut: Int = 1530455438 //16:30, 01.07.2018 CEST
        XCTAssertEqual(sut.asTimeInString(), "16:30")
    }
    
    func testIntDate(){
        let sut: Int = 1530455438 //16:30, 01.07.2018 CEST
        XCTAssertEqual(sut.asDateInString(), "01.07.2018")
    }
    
    func testDoubleRoundedToTwoPlaces(){
        let sut: Double = 1.123456
        XCTAssertEqual(sut.roundTo(places: 2), 1.12)
    }
    
    func testDestinationModel(){
        let json = ["cityFrom": "cityFrom", "countryFrom": ["name": "countryFrom"], "cityTo": "cityTo", "countryTo": ["name": "countryTo"], "mapIdto": "mapIdTo", "fly_duration": "fly_duration", "distance": 12.12, "price": 123, "conversion": ["EUR": 12.12], "dTime": 0, "aTime": 0] as [String:Any]
        let sut = Destination(json: json)
        XCTAssertNotNil(sut)
    }
    
}
