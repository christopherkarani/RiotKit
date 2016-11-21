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
    
    
    /**
     Looks up the summoner name for the specified identifier.
     
     - Parameters:
        - id: the summoner identifier
     
     - Returns: The summoner name as a `String`.
     */
    private static func getSummoner(usingID id: Int, withCompletionHandler handler: @escaping (_ summoner: String) -> Void)
    {
        //https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/
        
        //Sets the champion endpoint URL for the active `Region`
        let summonerURL = "/api/lol/\(Configuration.region.lowercased())/v1.4/summoner/" + String(id)
        
        RiotRequest.get(isStatic: false, forURL: summonerURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            print(serverResponse)
            handler("hello world")
            //            let championData = serverResponse["data"]
            //            for (championName, championBlob):(String, JSON) in championData {
            //                //Get the champion ID
            //                let championID = championBlob["id"]
            //                let championData = ChampionRequest.buildChampionData(withJSON: championBlob)
            //
            //                //Store the name to ID mapping for later use
            //                ChampionRequest.championMap[championName] = championID.int
            //                //Store image filename for the champion
            //                ChampionRequest.championDataMap[championID.int!] = championData
            //            }
        });
    }
    
    /**
     Looks up the summoner id for the specified name.
     
     - Parameters:
     - championName: the summoner id
     
     - Returns: A `Champion` struct, for the specified champion.
     */
    public static func getSummoner(usingName summonerName: String, withCompletionHandler handler: @escaping (_ summoner: String) -> Void)
    {
        //https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/
        
        //Sets the champion endpoint URL for the active `Region`
        let summonerURL = "/api/lol/\(Configuration.region.lowercased())/v1.4/summoner/by-name/" + summonerName
        
        RiotRequest.get(isStatic: false, forURL: summonerURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            print(serverResponse)
            handler("hello world")
//            let championData = serverResponse["data"]
//            for (championName, championBlob):(String, JSON) in championData {
//                //Get the champion ID
//                let championID = championBlob["id"]
//                let championData = ChampionRequest.buildChampionData(withJSON: championBlob)
//                
//                //Store the name to ID mapping for later use
//                ChampionRequest.championMap[championName] = championID.int
//                //Store image filename for the champion
//                ChampionRequest.championDataMap[championID.int!] = championData
//            }
        });
    }
    
}
