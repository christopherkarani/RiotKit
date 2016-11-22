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
    public static func getSummoner(usingID id: Int, withCompletionHandler handler: @escaping (_ summoners: [Summoner]) -> Void)
    {
        //https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/
        
        //Sets the summoner endpoint URL for the active `Region`
        let summonerURL = "/api/lol/\(Configuration.region.lowercased())/v1.4/summoner/" + String(id)
        
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
                print("Summoner \(sum.name), id: \(sum.id), level: \(sum.summonerLevel)")
            }
            print("Returing \(summoners.count) summoners")
            handler(summoners)
        });
    }
    
    /**
     Looks up the summoner id for the specified name.
     
     - Parameters:
        - summonerName: the summoner name
     
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
                print("Summoner \(sum.name), id: \(sum.id), level: \(sum.summonerLevel)")
            }
            print("Returing \(summoners.count) summoners")
            handler(summoners)
        });
    }
    
}
