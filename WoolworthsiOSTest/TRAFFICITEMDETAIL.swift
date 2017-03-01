//
//	TRAFFICITEMDETAIL.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct TRAFFICITEMDETAIL{

	var eVENT : EVENT?
	var rOADCLOSED : Bool?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]) {
		if let eVENTData = dictionary["EVENT"] as? [String : AnyObject] {
				eVENT = EVENT(fromDictionary: eVENTData)
			}
		rOADCLOSED = dictionary["ROADCLOSED"] as? Bool
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let eVENT = eVENT {
			dictionary["EVENT"] = eVENT.toDictionary() as AnyObject?
		}
		if let rOADCLOSED = rOADCLOSED {
			dictionary["ROADCLOSED"] = rOADCLOSED as AnyObject?
		}
		return dictionary
	}

}
