//
//  RiotKit.swift
//  RiotKit
//
//  Created by Grant Douglas on 16/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

class RiotKit {
    
    public static func configure(withProxyURL url: String) -> Void {
        Log.info("RiotKit configured with Proxy URL: \(url)")
        Configuration.proxyURL = url
    }
    
}
