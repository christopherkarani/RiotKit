//
//  RegionTests.swift
//  RiotKit
//
//  Created by Grant Douglas on 19/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import XCTest
@testable import RiotKit

class RegionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegionHostNameGeneration() {
        XCTAssertEqual(Region.getHostname(forRegion: "BR"), "br.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "EUNE"), "eune.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "EUW"), "euw.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "KR"), "kr.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "LAN"), "lan.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "LAS"), "las.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "NA"), "na.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "OCE"), "oce.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "TR"), "tr.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "RU"), "ru.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "PBE"), "pbe.api.pvp.net");
        XCTAssertEqual(Region.getHostname(forRegion: "GLOBAL"), "global.api.pvp.net");
    }
    
    func testGetRegionMap() {
        XCTAssertNotNil(Region.getRegions());
        XCTAssertNotNil(Region.getRegions()["NA"]);
    }
    
    func testGetInvalidRegion() {
        XCTAssertEqual(Region.getHostname(forRegion: "FOOBAR"), "");
    }
}
