//
//	NAVTECH.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct NAVTECH {

	var edge : EDGE?
	var versionId : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		if let edgeData = dictionary["EDGE"] as? [String : [String]] {
            edge = EDGE(fromDictionary: edgeData)
        }
		versionId = dictionary["VERSIONID"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let edge = edge {
			dictionary["EDGE"] = edge.toDictionary() as AnyObject?
		}
		if let versionId = versionId {
			dictionary["VERSIONID"] = versionId as AnyObject?
		}
		return dictionary
	}

}
