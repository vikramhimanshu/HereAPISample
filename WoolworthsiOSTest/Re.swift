//
//	Re.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct Re {

	var serviceUrl : String?
	var stations : Station?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]) {
		serviceUrl = dictionary["@serviceUrl"] as? String
        if let stationsData = dictionary["Stations"] as? [String : [[String : AnyObject]]] {
				stations = Station(fromDictionary: stationsData)
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if serviceUrl != nil{
			dictionary["@serviceUrl"] = serviceUrl as AnyObject?
		}
		if stations != nil{
			dictionary["Stations"] = stations?.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
