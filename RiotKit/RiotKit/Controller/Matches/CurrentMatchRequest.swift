//
//  CurrentMatchRequest.swift
//  RiotKit
//
//  Created by Grant Douglas on 15/12/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON


/// A class responsible for the querying and fetching of the current match.
open class CurrentMatchRequest {
    
    
    /**
     TODO
     */
    public static func getCurrentMatch(forSummoner id: Int, withCompletionHandler handler: @escaping (_ matchEntries: [MatchEntry]) -> Void)
    {

        //Sets the current match endpoint URL for the active `Region`
        let currentMatchURL = "/observer-mode/rest/consumer/getSpectatorGameInfo/\(Configuration.region.lowercased())/" + String(id)
        
        RiotRequest.get(isStatic: false, forURL: currentMatchURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            Log.debug("Response: \(serverResponse)")
            var matchEntries = [MatchEntry]()
            
            let totalGames: Int = serverResponse["totalGames"].int!
            Log.debug("Total Matches: \(totalGames)")
            let matches:JSON = serverResponse["matches"]
            
            for (_, matchData):(String, JSON) in matches
            {
                let date = NSDate(timeIntervalSince1970: TimeInterval(matchData["timestamp"].int!))
                let entry = MatchEntry(region: matchData["region"].string!,
                                       platformId: matchData["platformId"].string!,
                                       matchId: matchData["matchId"].int!,
                                       champion: matchData["champion"].int!,
                                       queue: matchData["queue"].string!,
                                       season: matchData["season"].string!,
                                       timestamp: date,
                                       lane: matchData["lane"].string!,
                                       role: matchData["role"].string!)
                Log.debug("Match: \(entry.matchId), match lane: \(entry.lane)")
                matchEntries.append(entry)
            }
            handler(matchEntries)
        });
    }
}
