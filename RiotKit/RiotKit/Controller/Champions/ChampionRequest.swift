//
//  ChampionRequest.swift
//  RiotKit
//
//  Created by Grant Douglas on 05/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON
import os


/// A class responsible for the querying and fetching of `Champion`'s.
open class ChampionRequest {
    
    
    /// Champion mappings, name `String` -> id `Int`.
    static var championMap = [String : Int]()
    /// Champion data mappings, id `Int` -> `ChampionData` filename.
    static var championDataMap = [Int : ChampionData]()
    
    
    /// A dictionary of `Champion` structs, using the champion id as the key.
    static var champions = [Int: Champion]()
    
    
    /// Fetches the latest `Champion` set
    init() {
        let _ = ChampionRequest.getChampionList(withImages: true, withCompletionHandler: { () -> Void in
                })
    }
    

    /**
        Looks up the champion name for the specified identifier.
     
        - Parameters:
            - id: the champion identifier
     
        - Returns: The champion name as a `String`.
     */
    private static func getChampionName(usingID id: Int) -> String
    {
        return findKey(forValue: id, withDictionary: ChampionRequest.championMap)!;
    }
    
    
    /**
         Looks up the `Champion` `struct` for the specified identifier.
         
         - Parameters:
            - id: the champion identifier
         
         - Returns: A `Champion` struct, for the specified champion.
     */
    public static func getChampion(usingID id: Int) -> Champion
    {
        return ChampionRequest.champions[id]!;
    }
    
    
    /**
         Looks up the `Champion` `struct` for the specified name.
         
         - Parameters:
            - championName: the champion name
         
         - Returns: A `Champion` struct, for the specified champion.
     */
    public static func getChampion(usingName championName: String) -> Champion
    {
        //Look up champ id by name
        let championID = ChampionRequest.championMap[championName]!
        return ChampionRequest.champions[championID]!
    }
    
    
    /**
        For all previously obtained champions, fetch the image from the dragon endpoint.
     
        - Parameters:
            - handler: the completion handler to be executed once complete.
     */
    public static func getChampionImages(withCompletionHandler handler: @escaping () -> Void)
    {
        // TODO - Fix hardcoded version/URL
        let latestGameVersion = "6.22.1"
        // TODO - All URL routing should be dynamic and managed centrally.
        let imageCDNUrl = "https://ddragon.leagueoflegends.com/cdn/\(latestGameVersion)/img/champion/"
        
        let count = ChampionRequest.championDataMap.count
        var activeCount:Int = 0
        for (championID, champData):(Int, ChampionData) in ChampionRequest.championDataMap {
            
            let championImageURL = imageCDNUrl + champData.image.full
            //print("ID: \(championID), fileName: \(championImageURL)")
            //print("Fetching remote image")
            RiotRequest.getImage(forURL: championImageURL, withCompletionHandler: { (obtainedImage: UIImage) -> Void in
                activeCount += 1
                //Obtained image.
                //print("\(championImageURL) (id: \(championID)): - \(obtainedImage)")
                ChampionRequest.champions[championID]?.icon = obtainedImage
                if (activeCount as Int == count)
                {
                    handler()
                }
            })
        }
    }
    
    
    /**
        Using the large `JSON` object of a champion, constructs multiple champion data structs, linking them
     
        - Parameters:
            - json_blob: the champion `JSON` blob..
        
        - Returns: A `ChampionData` struct, for the given champion `JSON` blob.
     */
    private static func buildChampionData(withJSON json_blob:JSON) -> ChampionData?
    {
        //Create image data
        let image = ImageData(w: json_blob["image"]["w"].int!,
                              full: json_blob["image"]["full"].string!,
                              sprite: json_blob["image"]["sprite"].string!,
                              group: json_blob["image"]["group"].string!,
                              h: json_blob["image"]["h"].int!,
                              x: json_blob["image"]["x"].int!)
        //Create champion info
        let info = ChampionInfo(defense: json_blob["info"]["defense"].int!,
                                magic: json_blob["info"]["magic"].int!,
                                difficulty: json_blob["info"]["difficulty"].int!,
                                attack: json_blob["info"]["attack"].int!)
        //Create passive image
        let passiveImage = ImageData(w: json_blob["passive"]["image"]["w"].int!,
                                     full: json_blob["passive"]["image"]["full"].string!,
                                     sprite: json_blob["passive"]["image"]["sprite"].string!,
                                     group: json_blob["passive"]["image"]["group"].string!,
                                     h: json_blob["passive"]["image"]["h"].int!,
                                     x: json_blob["passive"]["image"]["x"].int!)
        //Create passive spell
        let passive = PassiveSpell(sanitizedDescription: json_blob["passive"]["sanitizedDescription"].string!,
                                   description: json_blob["passive"]["description"].string!,
                                   name: json_blob["passive"]["name"].string!,
                                   image: passiveImage)
        //Create champion stats
        let stats = ChampionStats(attackrange: json_blob["stats"]["attackrange"].double!,
                                  mpperlevel: json_blob["stats"]["mpperlevel"].double!,
                                  mp: json_blob["stats"]["mp"].double!,
                                  attackdamage: json_blob["stats"]["attackdamage"].double!,
                                  hp: json_blob["stats"]["hp"].double!,
                                  hpperlevel: json_blob["stats"]["hpperlevel"].double!,
                                  attackdamageperlevel: json_blob["stats"]["attackdamageperlevel"].double!,
                                  armor: json_blob["stats"]["armor"].double!,
                                  mpregenperlevel: json_blob["stats"]["mpregenperlevel"].double!,
                                  hpregen: json_blob["stats"]["hpregen"].double!,
                                  critperlevel: json_blob["stats"]["critperlevel"].double!,
                                  spellblockperlevel: json_blob["stats"]["spellblockperlevel"].double!,
                                  mpregen: json_blob["stats"]["mpregen"].double!,
                                  attackspeedperlevel: json_blob["stats"]["attackspeedperlevel"].double!,
                                  spellblock: json_blob["stats"]["spellblock"].double!,
                                  attackspeedoffset: json_blob["stats"]["attackspeedoffset"].double!,
                                  crit: json_blob["stats"]["crit"].double!,
                                  hpregenperlevel: json_blob["stats"]["hpregenperlevel"].double!,
                                  armorperlevel: json_blob["stats"]["armorperlevel"].double!)
        
        var a_tips: [String] = [String]()
        for (_, json):(String, JSON) in json_blob["allytips"]
        {
            a_tips.append(json.string!)
        }
        var e_tips: [String] = [String]()
        for (_, json):(String, JSON) in json_blob["enemytips"]
        {
            e_tips.append(json.string!)
        }
        var tags: [String] = [String]()
        for (_, json):(String, JSON) in json_blob["tags"]
        {
            tags.append(json.string!)
        }
        
        let data = ChampionData(allytips: a_tips,
                                blurb: json_blob["blurb"].string!,
                                enemytips: e_tips,
                                id: json_blob["id"].int!,
                                image: image,
                                info: info,
                                key: json_blob["key"].string!,
                                lore: json_blob["lore"].string!,
                                name: json_blob["name"].string!,
                                partype: json_blob["partype"].string!,
                                passive: passive,
                                stats: stats,
                                tags: tags,
                                title: json_blob["title"].string!)
        //print(data)
        return data
    }

    
    /**
        Fetches the full list of champions from the static API endpoint.
     
        - Parameters:
            - shouldFetchImages: whether or not to automatically fetch the champion images. Defaults to `false`.
            - handler: the completion handler to be executed once complete.
     */
    public static func getChampionList(withImages shouldFetchImages:Bool = false, withCompletionHandler handler: @escaping () -> Void)
    {
        //Sets the champion endpoint URL for the active `Region`
        let championURL = "/api/lol/static-data/\(Configuration.region.lowercased())/\(Configuration.APIVersion)/champion/?champData=all"
        
        RiotRequest.get(isStatic: true, forURL: championURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
            
            let championData = serverResponse["data"]
            for (championName, championBlob):(String, JSON) in championData {
                //Get the champion ID
                let championID = championBlob["id"]
                let championData = ChampionRequest.buildChampionData(withJSON: championBlob)
                
                //Store the name to ID mapping for later use
                ChampionRequest.championMap[championName] = championID.int
                //Store image filename for the champion
                ChampionRequest.championDataMap[championID.int!] = championData
            }
            
            ///Sets the champion details endpoint URL for the active `Region`
            let detailsURL:String = "/api/lol/\(Configuration.region.lowercased())/\(Configuration.APIVersion)/champion"
            
            RiotRequest.get(isStatic: false, forURL: detailsURL, withCompletionHandler: { (serverResponse: JSON) -> Void in
                
                let championDetails:JSON = serverResponse["champions"]
                
                for (_, championDetailsBlob):(String, JSON) in championDetails {
                    let championID = championDetailsBlob["id"].int!
                    let championName = ChampionRequest.getChampionName(usingID: championID)
                    
                    let championEntry = Champion(id: championID,
                                                         name: championName,
                                                         active: championDetailsBlob["active"].bool!,
                                                         botEnabled: championDetailsBlob["botEnabled"].bool!,
                                                         botMMEnabled: championDetailsBlob["botMmEnabled"].bool!,
                                                         freeEnabled: championDetailsBlob["freeToPlay"].bool!,
                                                         rankedEnabled: championDetailsBlob["rankedPlayEnabled"].bool!,
                                                         icon: nil,
                                                         championData: ChampionRequest.championDataMap[championID])
                    ChampionRequest.champions[championID] = championEntry
                }
                print("Fetched \(ChampionRequest.champions.count) champions")
                if shouldFetchImages
                {
                    print("Fetching images")
                    self.getChampionImages(withCompletionHandler: { () -> Void in
                        print("Fetched images")
                        handler()
                    })
                }
                else
                {
                    handler()
                }
            })
        })
    }
}
