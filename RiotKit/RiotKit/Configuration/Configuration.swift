//
//  Configuration.swift
//  RiotKit
//
//  Created by Grant Douglas on 16/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

/// The default route format for the API.
let apiRoute = "https://:host/api/lol/:region/:version"


/// `Configuration` class, for framework config values, such as `proxyURL`, `Region` data, etc.
open class Configuration
{
    /// Holds the API version to use
    public static let APIVersion = "v1.2"
    
    /** 
        `Struct` to hold the config data
        
        - proxyURL: the proxy service we should send requests to. E.g. using https://git.hexplo.it/RiotKit/Singed
        - region: the region to use
     */
    public struct config {
        static var proxyURL: String?;
        static var region = "EUW";
    }
    
    /// Getter and Setter for the `proxyURL`
    open class var proxyURL: String {
        get {
            let proxy = config.proxyURL
            if (((proxy != nil)) && proxy != "") {
                return proxy!;
            }
            else {
                fatalError("You must configure a web proxy to interact with the Riot API. A proxy service has been released open source alongside RiotKit: https://git.hexplo.it/RiotKit/Singed. You should set this up on your own web server.");
            }
        }
        set {
            if (newValue == "")
            {
                Log.error("You must configure a web proxy to interact with the Riot API. A proxy service has been released open source alongside RiotKit: https://git.hexplo.it/RiotKit/Singed. You should set this up on your own web server.");
            }
            else
            {
                //Trim trailing slash if present.
                let lastChar = newValue.substring(from:newValue.index(newValue.endIndex, offsetBy: -1))
                if (lastChar == "/")
                {
                    config.proxyURL = String(newValue.characters.dropLast());
                }
                else
                {
                    config.proxyURL = newValue;
                }
            }
        }
    }
    
    /// Getter and Setter for the `region`
    open class var region: String {
        get { return config.region; }
        set { config.region = newValue; }
    }
}
