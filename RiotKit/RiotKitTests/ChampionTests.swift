//
//  ChampionTests.swift
//  RiotKit
//
//  Created by Grant Douglas on 19/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//


import XCTest
@testable import RiotKit

class ChampionTests: XCTestCase {
    
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
    
    // Test the fetching of the champion list
    func testFetchChampionList() {
        let asyncExpectation = expectation(description: "Fetch champions asynchronously")
        let _ = ChampionRequest.init()
        ChampionRequest.getChampionList(withImages: false, withCompletionHandler: { () -> Void in
            XCTAssertNotNil(ChampionRequest.championMap)
            XCTAssertEqual(ChampionRequest.championMap["Rammus"], 33)
            XCTAssertEqual(ChampionRequest.champions[67]?.name, "Vayne")
            XCTAssertNotEqual(ChampionRequest.championMap["Shaco"], 33)
            
            let a:Champion = ChampionRequest.getChampion(usingID: 67)
            XCTAssertEqual(ChampionRequest.champions[67]?.freeEnabled, a.freeEnabled)
            
            let b:Champion = ChampionRequest.getChampion(usingName: "Vayne")
            XCTAssertEqual(ChampionRequest.champions[67]?.freeEnabled, b.freeEnabled)
            
            //Images should be nil
            XCTAssertEqual(b.icon, nil)
            asyncExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    // Test the fetching of the champion images
    func testFetchChampionImages() {
        let asyncExpectation = expectation(description: "Fetch champion images asynchronously")
        
        ChampionRequest.getChampionList(withImages: true, withCompletionHandler: { () -> Void in
            XCTAssertNotNil(ChampionRequest.championMap)
            XCTAssertEqual(ChampionRequest.championMap["Rammus"], 33)
            XCTAssertEqual(ChampionRequest.champions[67]?.name, "Vayne")
            XCTAssertNotEqual(ChampionRequest.championMap["Shaco"], 33)
            
            let b:Champion = ChampionRequest.getChampion(usingName: "Vayne")
            XCTAssertNotEqual(b.icon, nil )
            XCTAssertEqual(ChampionRequest.champions[67]?.icon, b.icon)
            
            asyncExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 60, handler: nil)
    }
}
