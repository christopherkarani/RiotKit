//
//  ChampionStats.swift
//  RiotKit
//
//  Created by Grant Douglas on 18/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation


/// `ChampionStats` struct, containing all of the champion's stats
public struct ChampionStats {
    /// Champion attack range value
    public let attackrange: Double;
    /// Champion magic penetration per level value
    public let mpperlevel: Double;
    /// Champion magic penetration value
    public let mp: Double;
    /// Champion attack damage value
    public let attackdamage: Double;
    /// Champion hit points value
    public let hp: Double;
    /// Champion hit points per level value
    public let hpperlevel: Double;
    /// Champion attack damage per level value
    public let attackdamageperlevel: Double;
    /// Champion armor value
    public let armor: Double;
    /// Champion mana points regeneration per level value
    public let mpregenperlevel: Double;
    /// Champion hit points regeneration value
    public let hpregen: Double;
    /// Champion critical hits per level value
    public let critperlevel: Double;
    /// Champion spell block per level value
    public let spellblockperlevel: Double;
    /// Champion mana point regeneration value
    public let mpregen: Double;
    /// Champion attack speed per level value
    public let attackspeedperlevel: Double;
    /// Champion spell block value
    public let spellblock: Double;
    /// Champion attack speed offset value
    public let attackspeedoffset: Double;
    /// Champion critical hit value
    public let crit: Double;
    /// Champion hit point regeneration per level value
    public let hpregenperlevel: Double;
    /// Champion armor penetration per level value
    public let armorperlevel: Double;
}
