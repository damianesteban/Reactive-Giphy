//
//  GiphModelTests.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import ReactiveGiphy

class GiphModelTests: XCTestCase {
    
    var testHelper: GiphModelTestHelper!
    
    // Subject Under Test
    var sut: Giph!
    
    override func setUp() {
        super.setUp()
        sut = Giph(id: "testId", username: "testUsername", urlString: "http://test.com", ratingString: "y", trendingDateString: "1970-01-01 00:00:00")
        testHelper = GiphModelTestHelper()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldSetProperties() {
        
        XCTAssertEqual(sut.id, "testId", "Initializer should set id")
        XCTAssertEqual(sut.username, "testUsername", "Initializer should set username")
        XCTAssertEqual(sut.urlString, "http://test.com", "Initializer should set urlString")
        XCTAssertEqual(sut.ratingString, "y", "Initializer should set ratingString")
        XCTAssertEqual(sut.trendingDateString, "1970-01-01 00:00:00", "Initializer should set trendingDateString")
    }
    
    func testContentRating_ShouldReturnContentRating() {
        XCTAssertEqual(sut.contentRating, ContentRating.FamilyFriendly, "Computer variable should return ContentRating")
    }
    
    func testJSON_ShouldSetPropertiesFromJSON() {
        let testJSONArray = testHelper.loadJSONFromFile("trending")["data"].arrayValue
        let testGiph = Giph.fromJSON(testJSONArray[0])
        
        XCTAssertEqual(testGiph.id, "l0K4jDs7BvA3M8QOQ", "Should set id from JSON")
        XCTAssertEqual(testGiph.username, "topshelfrecords", "Should set username from JSON")
        XCTAssertEqual(testGiph.urlString, "http://media2.giphy.com/media/l0K4jDs7BvA3M8QOQ/200w_d.gif", "Should set urlString from JSON")
        XCTAssertEqual(testGiph.ratingString, "pg", "Should set ratingString from JSON")
        XCTAssertEqual(testGiph.trendingDateString, "2016-08-04 13:15:02", "Should set trendingDateString from JSON")
    }
}

extension GiphModelTests {
    struct GiphModelTestHelper: JSONLoader {}
}
