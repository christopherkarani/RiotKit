//
//  ConfigurationTests.swift
//  RiotKit
//
//  Created by Grant Douglas on 19/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import XCTest
@testable import RiotKit

class ConfigurationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSetproxyURLValid() {
        Configuration.proxyURL = "FOOBAR123"
        XCTAssertNotNil(Configuration.proxyURL);
        XCTAssertEqual(Configuration.proxyURL, "FOOBAR123");
    }
    
    func testNoProxyURLSet() {
        Configuration.proxyURL = ""
        XCTAssertNotNil(Configuration.proxyURL);
    }
    
    func testSlashStrip()
    {
        Configuration.proxyURL = "FOOBAR123/"
        XCTAssertNotNil(Configuration.proxyURL);
        XCTAssertEqual(Configuration.proxyURL, "FOOBAR123");
    }
    
    func testSetRegion() {
        Configuration.region = "UK"
        XCTAssertNotNil(Configuration.region);
        XCTAssertEqual(Configuration.region, "UK");
    }
    
    

}
