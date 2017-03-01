//
//	TrafficRoot.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct TrafficRoot{

	var timestamp : String?
	var trafficItems : TRAFFICITEMS?
	var version : Int?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]) {
		timestamp = dictionary["TIMESTAMP"] as? String
        
        if let tRAFFICITEMSData = dictionary["TRAFFICITEMS"] as? [String : [[String : AnyObject]]] {
            trafficItems = TRAFFICITEMS(fromDictionary: tRAFFICITEMSData)
        }
		version = dictionary["VERSION"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if timestamp != nil{
			dictionary["TIMESTAMP"] = timestamp as AnyObject?
		}
		if trafficItems != nil{
			dictionary["TRAFFICITEMS"] = trafficItems?.toDictionary() as AnyObject?
		}
		if version != nil{
			dictionary["VERSION"] = version as AnyObject?
		}
		return dictionary
	}

}
