//
//  SummonerTests.swift
//  RiotKit
//
//  Created by Grant Douglas on 21/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import XCTest
@testable import RiotKit

class SummonerTests: XCTestCase {
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

    
    // Test the fetching of the summoners using the name
    func testFetchSummonerUsingName() {
        let asyncExpectation = expectation(description: "Fetch summoner asynchronously")
        
        let summonerNames = ["Atherz", "Arcedants", "Durrann", "DracoRenati", "t3rminalV"]
        
        for name in summonerNames
        {
            SummonerRequest.getSummoner(usingName: name, withCompletionHandler: { (summoners: [Summoner]) -> Void in
                
                XCTAssertEqual(summoners.count, 1)
                XCTAssertEqual(summoners[0].name, name)
                
            })
        }
        
        let allSummoners = summonerNames.joined(separator: ",")
        SummonerRequest.getSummoner(usingName: allSummoners, withCompletionHandler: { (summoners: [Summoner]) -> Void in
            
            XCTAssertEqual(summoners.count, summonerNames.count)
            for summoner in summoners
            {
                XCTAssertNotNil(summoner.id)
                XCTAssertNotNil(summoner.name)
            }
            
            asyncExpectation.fulfill()
        })
        
        waitForExpectations(timeout: TimeInterval(testTimeout), handler: nil)
    }
    
    // Test the fetching of the summoners using the id
    func testFetchSummonerUsingID() {
        let asyncExpectation = expectation(description: "Fetch summoner asynchronously using ID")
        
        let summonerID = 39470277
        
        SummonerRequest.getSummoner(usingID: summonerID, withCompletionHandler: { (summoners: [Summoner]) -> Void in
            XCTAssertEqual(summoners.count, 1)
            XCTAssertEqual(summoners[0].id, summonerID)
            XCTAssertEqual(summoners[0].name, "Atherz")
            asyncExpectation.fulfill()
        })

        waitForExpectations(timeout: TimeInterval(testTimeout), handler: nil)
    }
}
