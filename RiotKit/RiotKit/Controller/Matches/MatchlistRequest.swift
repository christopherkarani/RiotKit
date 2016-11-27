//
//  MatchlistRequest.swift
//  RiotKit
//
//  Created by Grant Douglas on 24/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON


/// A class responsible for the querying and fetching of `Matchlist` details.
open class MatchlistRequest {
    
    
    /**
        TODO
     */
    public static func getMatchlist(forSummoner id: Int, withCompletionHandler handler: @escaping (_ summoners: [String]) -> Void)
    {
        //https://euw.api.pvp.net/api/lol/euw/v2.2/matchlist/by-summoner/39470277
        
        //Sets the summoner endpoint URL for the active `Region`
        let matchListURL = "/api/lol/\(Configuration.region.lowercased())/v2.2/matchlist/by-summoner/" + String(id)
        
        RiotRequest.get(isStatic: false, forURL: matchListURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            for (foo, matchData):(String, JSON) in serverResponse
            {
               Log.debug("Foo: \(foo), matchData: \(matchData)")
            }
            handler(["Hello"])
        });
    }
    
    
}
