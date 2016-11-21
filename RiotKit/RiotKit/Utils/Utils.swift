//
//  Utils.swift
//  RiotKit
//
//  Created by Grant Douglas on 11/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation


/** 
    Looks up and returns the dictionary key for the specified value.
    - Parameters:
        - v: the value to look for within `d`
        - d: the dictionary to search
 
    - Returns: The key as a `String` or `nil` of no match found.
*/
func findKey(forValue v: Int, withDictionary d: [String : Int]) -> String?
{
    for (name, id) in d
    {
        if (id == v)
        {
            return name
        }
    }
    return nil
}
