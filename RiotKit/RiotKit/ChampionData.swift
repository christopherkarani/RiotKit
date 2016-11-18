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
    allytips	List[string]
    blurb	string
    enemytips	List[string]
    id	int
    image ImageDto
    info	InfoDto
     key	string
     lore	string
     name	string
     partype	string
    passive	PassiveDto
 recommended	List[RecommendedDto] //TODO - too much data
 skins	List[SkinDto] //TODO - too much data
 spells	List[ChampionSpellDto] //TODO - too much data
    stats	StatsDto //TODO - too much data
    tags	List[string]
    title	string
 */

/// `Champion` struct, containing all of the relevant status data
public struct ChampionData {
    public let allytips: [String];
    public let blurb: String;
    public let enemytips: [String];
    public let id: Int;
    public let image: ImageData;
    public let info: ChampionInfo;
    public let key: String;
    public let lore: String;
    public let name: String;
    public let partype: String;
    public let passive: PassiveSpell;
    public let stats: ChampionStats;
    public let tags: [String];
    public let title: String;
}
