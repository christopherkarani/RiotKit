//
//  RiotAPIRequest.swift
//  RiotKit
//
//  Created by Grant Douglas on 12/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireImage


/// A class responsible for the issuing of GET and POST requests to riotgames API endpoints
open class RiotRequest {
    
    
    /// Sets the region URL to the `Region` set in `Configuration`.
    internal static let regionURL = Region.getHostname(forRegion: Configuration.region)
    
    
    /**
         Fetches a remote image `RiotRequest`.
         
         - Parameters:
             - url: the URL of the remote image
             - handler: the Completion Handler to be executed upon success
     */
    public static func getImage(forURL url: String, withCompletionHandler handler: @escaping (_ obtainedImage: UIImage) -> Void)
    {
        Alamofire.request(url).responseImage { response in
            
//            print(response.request!)
//            print(response.response!)
//            print(response.result)
            
            if let image = response.result.value {
                handler(image)
            }
        }
    }
    
    
    /**
         Issues a GET request, using `RiotRequest`.
         
         - Parameters:
            - isStatic: whether or not the request is destined for the static API endpoint
            - url: the URL we want to send the request to
            - handler: the Completion Handler to be executed upon success
     */
    public static func get(isStatic:Bool, forURL url: String, withCompletionHandler handler: @escaping (_ serverResponse: JSON) -> Void)
     {
        /// The base URL for use
        //var requestURL = "https://\(Configuration.proxyURL)/\(RiotRequest.regionURL)"
        var requestURL = "http://127.0.0.1:9090/\(RiotRequest.regionURL)"
        
        //If static, swap in the static API hostname
        if (isStatic)
        {
            requestURL = "http://127.0.0.1:9090/\(Region.getHostname(forRegion: "GLOBAL"))"
        }
        //Url encode the URL because of API mess.
        requestURL += "\(url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"

        //Issue the request using `Alamofire`. Obtains a JSON response asynchronously
        Alamofire.request(requestURL, method: .get, encoding: URLEncoding.default).responseJSON { responseBody in
            if responseBody.result.value != nil {
                //Set the server response, to be obtained by the calling class.
                //There is a much better way of doing this.
                let serverResponse = JSON(data: responseBody.data!)
                handler(serverResponse)
            }
        }
     }
    
}
