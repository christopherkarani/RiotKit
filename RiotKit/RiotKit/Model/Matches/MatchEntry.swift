//
//  MatchEntry.swift
//  RiotKit
//
//  Created by Grant Douglas on 28/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation


/// `MatchEntry` struct, containing a MatchList Entry
public struct MatchEntry {
    /// The `MatchEntry` region
    public let region: String;
    /// The `MatchEntry` region ID
    public let platformId: String;
    /// The `MatchEntry` match ID reference
    public let matchId: Int;
    /// The `MatchEntry` champion ID
    public let champion: Int;
    /// The `MatchEntry` queue type
    public let queue: String;
    /// The `MatchEntry` season, e.g. 2017
    public let season: String;
    /// The `MatchEntry` timestamp as a `Date` object
    public let timestamp: NSDate;
    /// The `MatchEntry` match lane, e.g. jungle, bottom, middle
    public let lane: String;
    /// The `MatchEntry` match role
    public let role: String;
}
