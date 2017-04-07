//
//  CurrentMatchTests.swift
//  Pods
//
//  Created by Grant Douglas on 15/12/2016.
//
//

import Foundation
import XCTest
@testable import RiotKit

class CurrentMatchTests: XCTestCase {
    override func setUp() {
        super.setUp()
        RiotKit.configure(withProxyURL: "staging-singed.riotkit.xyz")
        Configuration.region = "EUW"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
//    // Test the fetching of the summoners using the name
//    func testFetchSummonerUsingName() {
//        let asyncExpectation = expectation(description: "Fetch summoner asynchronously")
//        let summonerID = 39470277
//        
//        CurrentMatchRequest.getCurrentMatch(forSummoner: summonerID,  withCompletionHandler: { (matchEntries: [MatchEntry]) -> Void in
//            XCTAssertGreaterThan(matchEntries.count, 1)
//            asyncExpectation.fulfill()
//        })
//        
//        waitForExpectations(timeout: TimeInterval(testTimeout), handler: nil)
//    }
}
