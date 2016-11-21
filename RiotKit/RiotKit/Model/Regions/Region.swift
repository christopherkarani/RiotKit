//
//  Region.swift
//  RiotKit
//
//  Created by Grant Douglas on 16/03/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation


/// `Region` class to obtain and construct region URLs
open class Region {
    
    
    /// The base URL
    /// https://developer.riotgames.com/docs/regional-endpoints
    internal static var hostString = "api.pvp.net";
    
    /// Maps the region to platform ID
    /// https://developer.riotgames.com/docs/regional-endpoints
    internal static var regionPlatforms = [
        "BR" : "BR1",
        "EUNE" : "EUN1",
        "EUW" : "EUW1",
        "KR" : "KR",
        "LAN" : "LA1",
        "LAS" : "LA2",
        "NA" : "NA1",
        "OCE" : "OC1",
        "TR" : "TR1",
        "RU" : "RU",
        "PBE" : "PBE1",
        "GLOBAL" : ""
    ]
    
    
    /**
        Obtains the region map
     
        - Returns: a `Dictionary` containing the region mappings
     
     */
    internal static func getRegions() -> [String:String]
    {
        return self.regionPlatforms;
    }
    
    
    /**
        Fetches the region hostname for the given region
         
        - Parameters:
            - region: the region to get the hostname for.
         
        - Returns: A `String` containg the hostname for the region.
     */
    public static func getHostname(forRegion region: String) -> String
    {
        guard (self.regionPlatforms[region] != nil) else {
            return "";
        }
        return region.lowercased() + "." + self.hostString;
    }
}
