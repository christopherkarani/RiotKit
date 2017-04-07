//
//  SummonerRequest.swift
//  RiotKit
//
//  Created by Grant Douglas on 21/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON

/// A class responsible for the querying and fetching of `Summoner`'s.
open class SummonerRequest {
    
    
    public static func getLeagueForSummoner(usingID id: Int, withCompletionHandler handler: @escaping (_ summoners: String) -> Void)
    {
        //https://euw.api.riotgames.com/api/lol/EUW/v2.5/league/by-summoner/
        
        //Sets the summoner endpoint URL for the active `Region`
        let leagueURL = "/api/lol/\(Configuration.region.lowercased())/v2.5/league/by-summoner/" + String(id)
        
        RiotRequest.get(isStatic: false, forURL: leagueURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            var player_id:String = ""
            
            let entries:JSON = serverResponse[String(id)]
            Log.info(entries);
            for (_, leagueData):(String, JSON) in entries
            {
                
                player_id = leagueData["playerOrTeamId"].string!
                Log.info("Player id: \(player_id)")
            }
            handler(player_id)
        });

    }
    
    
    /**
     Get a summoner struct for the specified identifier.
     
     - Parameters:
        - id: the summoner identifier
     
     - Returns: An array of 1 or more Summoner structs, for the specified summoner id.
     */
    public static func getSummoner(usingID id: Int, withCompletionHandler handler: @escaping (_ summoners: [Summoner]) -> Void)
    {
        //https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/
        
        //Sets the summoner endpoint URL for the active `Region`
        let summonerURL = "/api/lol/\(Configuration.region.lowercased())/v1.4/summoner/" + String(id)
        
        RiotRequest.get(isStatic: false, forURL: summonerURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            var summoners = [Summoner]()
            
            for (_, summonerData):(String, JSON) in serverResponse
            {
                // get league data
                getLeagueForSummoner(usingID: summonerData["id"].int!, withCompletionHandler: { (league: String) -> Void in
                    Log.debug(league);
                    let sum = Summoner(id: summonerData["id"].int!,
                                       name: summonerData["name"].string!,
                                       profileIconId: summonerData["profileIconId"].int!,
                                       revisionDate: summonerData["revisionDate"].int!,
                                       summonerLevel: summonerData["summonerLevel"].int!)
                    summoners.append(sum)
                    Log.debug("Summoner \(sum.name), id: \(sum.id), level: \(sum.summonerLevel)")
                    Log.debug("Returing \(summoners.count) summoners")
                    handler(summoners)
                });
            }
            
        });
    }
    
    /**
     Get a summoner structs for the specified name (or names).
     
     - Parameters:
        - summonerName: the summoner name or names. Please provide multiple names as a comma separated list,
         e.g
         ```
         let summonerNames = ["Atherz", "Arcedants", "Durrann", "DracoRenati", "S Rated AD"]
         let allSummoners = summonerNames.joined(separator: ",")
         ```
     
     - Returns: An array of 1 or more `Summoner` structs, for the specified summoner name.
     */
    public static func getSummoner(usingName summonerName: String, withCompletionHandler handler: @escaping (_ summoners: [Summoner]) -> Void)
    {
        //Sets the summoner endpoint URL for the active `Region`
        //As per rito guidance, summoner names need to be URL encoded prior to issuing the request.
        let encodedName = summonerName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let summonerURL = "/api/lol/\(Configuration.region.lowercased())/v1.4/summoner/by-name/" + encodedName
        
        RiotRequest.get(isStatic: false, forURL: summonerURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            var summoners = [Summoner]()
            
            for (_, summonerData):(String, JSON) in serverResponse
            {
                let sum = Summoner(id: summonerData["id"].int!,
                                   name: summonerData["name"].string!,
                                   profileIconId: summonerData["profileIconId"].int!,
                                   revisionDate: summonerData["revisionDate"].int!,
                                   summonerLevel: summonerData["summonerLevel"].int!)
                summoners.append(sum)
                Log.debug("Summoner \(sum.name), id: \(sum.id), level: \(sum.summonerLevel)")
            }
            Log.debug("Returing \(summoners.count) summoners")
            handler(summoners)
        });
    }
    
}
