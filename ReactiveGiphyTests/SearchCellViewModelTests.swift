//
//  SearchCellViewModelTests.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/9/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import XCTest
@testable import ReactiveGiphy

class SearchCellViewModelTests: XCTestCase {
    
    // Subject Under Test
    var sut: SearchCellViewModel!
    
    var testGiph: Giph!
    
    override func setUp() {
        super.setUp()
        testGiph = Giph(id: "testId", username: "testUsername", urlString: "http://test.com", ratingString: "y", trendingDateString: "1970-01-01 00:00:00")
        sut = SearchCellViewModel(giph: testGiph)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldSetProperties() {
        XCTAssertEqual(sut.id, testGiph.id, "Should set id from giph")
        XCTAssertEqual(sut.username, testGiph.username, "Should set username from giph")
        XCTAssertEqual(sut.trendingDateString, testGiph.trendingDateString, "Should set trendingDateString from giph")
        XCTAssertEqual(sut.ratingString, testGiph.ratingString, "Should set ratingString from giph")
        XCTAssertEqual(sut.urlString, testGiph.urlString, "Should set urlString from giph")
    }
    
    func testURL_ShouldSetURL() {
        
    }
    
}
