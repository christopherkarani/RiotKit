//
//  MatchListTests.swift
//  RiotKit
//
//  Created by Grant Douglas on 24/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

import XCTest
@testable import RiotKit

class MatchListTests: XCTestCase {
    override func setUp() {
        super.setUp()
        RiotKit.configure(withProxyURL: "singed.riotkit.xyz")
        Configuration.region = "EUW"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // Test the fetching of the summoners using the name
    func testFetchSummonerUsingName() {
        let asyncExpectation = expectation(description: "Fetch summoner asynchronously")
        let summonerID = 39470277
        
       MatchlistRequest.getMatchlist(forSummoner: summonerID,  withCompletionHandler: { (matchEntries: [MatchEntry]) -> Void in
            XCTAssertEqual(matchEntries.count, 1)
            asyncExpectation.fulfill()
        })
        
        waitForExpectations(timeout: TimeInterval(testTimeout), handler: nil)
    }
}
