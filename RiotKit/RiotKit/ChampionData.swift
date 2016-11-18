//
//  ChampionData.swift
//  RiotKit
//
//  Created by Grant Douglas on 18/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON

/*
 TDOO
 recommended	List[RecommendedDto] //TODO - too much data
 skins	List[SkinDto] //TODO - too much data
 spells	List[ChampionSpellDto] //TODO - too much data
 */

/// `Champion` struct, containing all of the relevant status data
public struct ChampionData {
    /// Tips for allies, when playing **with** this champion
    public let allytips: [String];
    /// Champion blurb
    public let blurb: String;
    /// Tips for enemies, when playing **against** champion
    public let enemytips: [String];
    /// Champion id
    public let id: Int;
    /// Champion image, linked struct
    public let image: ImageData;
    /// Champion info, linked struct
    public let info: ChampionInfo;
    /// Champion name/key
    public let key: String;
    /// Champion lore
    public let lore: String;
    /// Champion name
    public let name: String;
    /// Champion partype, e.g. MP
    public let partype: String;
    /// Champion passive (spell), linked struct
    public let passive: PassiveSpell;
    ///// Champion stats, linked struct
    public let stats: ChampionStats;
    /// Champion tags, e.g. MAGE, MARKSMAN
    public let tags: [String];
    /// Champion title
    public let title: String;
}
