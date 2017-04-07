//
//  Summoner.swift
//  RiotKit
//
//  Created by Grant Douglas on 22/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

/// `Summoner` struct, containing all of the relevant summoner data
public struct Summoner {
    /// The `Summoner` identifier
    public let id: Int;
    /// The `Summoner` name
    public let name: String;
    /// The profile icon identifier in use for the `Summoner`
    public let profileIconId: Int;
    /// Date (epoch) of last modifications to the `Summoner`
    public let revisionDate: Int;
    /// The level (1-30) of the `Summoner
    public let summonerLevel: Int;
    // Rank of summoner
    //public let summonerRank: Int;
}
