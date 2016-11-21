//
//  Champion.swift
//  RiotKit
//
//  Created by Grant Douglas on 16/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation


/// `Champion` struct, containing all of the relevant status data
public struct Champion {
    /// The `Champion` identifier
    public let id: Int;
    /// The `Champion` name
    public let name: String;
    /// Whether or not the `Champion` is active or disabled
    public let active: Bool;
    /// Whether or not the `Champion` can be used as a bot
    public let botEnabled: Bool;
    /// Whether or not the `Champion` is playable in CoOp vs AI
    public let botMMEnabled: Bool;
    /// Whether or not the `Champion` is in the free rotation `Champion` pool
    public let freeEnabled: Bool;
    /// Whether or not the `Champion` is available in ranked matches.
    public let rankedEnabled: Bool;
    /// The `Champion` avatar/icon. Var because we set this after.
    /// Optional because it has to be nil initially
    public var icon: UIImage?;
    /// THe champion data
    public var championData: ChampionData?;
}
