//
//  PassiveSpell.swift
//  RiotKit
//
//  Created by Grant Douglas on 18/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

/// `PassiveSpell` struct, containing data concerning the champion's passive spell
public struct PassiveSpell {
    /// The sanitized description of the spell
    public let sanitizedDescription: String;
    /// The pure description of the spell
    public let description: String;
    /// The name of the spell
    public let name: String;
    /// The image data of the spell, linked struct
    public let image: ImageData;
}
