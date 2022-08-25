//
//  HomeEventTests.swift
//  CleanAnalyticsArchitectureTests
//
//  Created by Greener Chen on 2022/8/25.
//

import XCTest
@testable import CleanAnalyticsArchitecture

class HomeEventTests: XCTestCase {
    var sut: ViewController!
    var spyEnginee: AnalyticsEngineDI!
    
    override func setUpWithError() throws {
        spyEnginee = SpyEngine(name: "spy")
        sut = ViewController()
        sut.analytics = AnalyticsManager(engines: [spyEnginee])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHomeScreenAppearedEvent() throws {
        sut.viewDidAppear(true)
        
        XCTAssertEqual(spyEnginee.events.count, 1)
        guard let event = spyEnginee.events.first else {
            XCTFail("Empty events")
            return
        }
        XCTAssertEqual(event.name, "HomeScreenAppeared")
    }

}
