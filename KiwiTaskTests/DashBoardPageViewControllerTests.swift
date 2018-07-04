//
//  DashBoardTestViewControllerTests.swift
//  KiwiTaskTests
//
//  Created by Ondrej Andrysek on 7/1/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import XCTest
@testable import KiwiTask

class DashBoardPageViewControllerTests: XCTestCase {
    
    var sut: DashboardPageViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = DashboardPageViewController()
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSUTCanInstatiateViewController(){
        XCTAssertNotNil(sut)
    }
    
    func testShouldNotSetPageControllerDataSource(){
        XCTAssertNil(sut.dataSource)
    }
    
    func testShouldNotSetPageControllerDelegate(){
        XCTAssertNil(sut.delegate)
    }
    
    func testShouldSetPageControllerDataSourceAndDelegate(){
        sut.setupData()
        XCTAssertNotNil(sut.dataSource)
        XCTAssertNotNil(sut.delegate)
    }
    
}
