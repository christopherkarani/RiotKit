//
//  Logger.swift
//  RiotKit
//
//  Created by Grant Douglas on 23/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import Log


extension Formatters {
    
    static let detailed = Formatter("[🕵️ %@] %@ (Line %@) --> %@: %@\n", [
        .level,
        .file(fullPath: false, fileExtension: false),
        .line,
        .function,
        .message
        ])
}

extension Themes {
    static let tomorrowNight = Theme(
        trace:   "#C5C8C6",
        debug:   "#81A2BE",
        info:    "#B5BD68",
        warning: "#F0C674",
        error:   "#CC6666"
    )
}

let Log = Logger(formatter: .detailed, theme: nil)
