//
//  League.swift
//  RiotKit
//
//  Created by Grant Douglas on 22/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

/// `League` struct, containing all of the relevant summoner data
public struct League {
    /// Is the summoner new to this league?
    public let isFreshBlood: Bool;
    /// The `Summoner` division number
    public let division: Int;
    /// Has the summoner been in this league for 100+ games?
    public let isVeteran: Bool;
    // wins
    public let wins: Int;
    // losses
    public let losses: Int;
    // Is inactive?
    public let isInactive: Bool;
    // Has won 3 games+ in a row?
    public let isHotStreak: Bool;
    // Summoner's current LP
    public let leaguePoints: Int;
}
