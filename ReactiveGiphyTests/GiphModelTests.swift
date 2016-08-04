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
    
    override func setUp() {
        super.setUp()
        testHelper = GiphModelTestHelper()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldSetProperties() {
        let testGiph = Giph(id: "testid", username: "testuser", urlString: "http://testurl.com")
        
        XCTAssertEqual("testid", testGiph.id, "Initializer should set id")
        XCTAssertEqual("testuser", testGiph.username, "Initializer should set username")
        XCTAssertEqual("http://testurl.com", testGiph.urlString, "Initializer should set urlString")
    }
    
    func testURL_ShouldReturnURL() {
        let testGiph = Giph(id: "testid", username: "testuser", urlString: "http://testurl.com")
        let url = NSURL(string: testGiph.urlString)
        
        XCTAssertEqual(url, testGiph.url, "Computed variable should return NSURL")
    }
    
    func testJSON_ShouldSetPropertiesFromJSON() {
        let testJSONArray = testHelper.loadJSONFromFile("trending")["data"].arrayValue
        let testGiph = Giph.fromJSON(testJSONArray[0])
        
        XCTAssertEqual("l0K4jDs7BvA3M8QOQ", testGiph.id, "Should set id from JSON")
        XCTAssertEqual("topshelfrecords", testGiph.username, "Should set username from JSON")
        XCTAssertEqual("http://media2.giphy.com/media/l0K4jDs7BvA3M8QOQ/200w_d.gif", testGiph.urlString, "Should set urlString from JSON")
        
    }
}

extension GiphModelTests {
    struct GiphModelTestHelper: JSONLoader {}
}
