//
//  ImageData.swift
//  RiotKit
//
//  Created by Grant Douglas on 18/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation


/// `ImageData` struct, containing all of the relevant object image data
public struct ImageData {
    /// Image width
    public let w: Int;
    /// The full name of the image
    public let full: String;
    /// The name of the sprite image
    public let sprite: String;
    /// The name of the group image
    public let group: String;
    /// Image height
    public let h: Int;
    /// Image x
    public let x: Int;
}
