//
//	EVENT.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct EVENT{

	var eventItemCancelled : Bool?
	var scheduledConstructionEvent : SCHEDULEDCONSTRUCTIONEVENT?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		eventItemCancelled = dictionary["EVENTITEMCANCELLED"] as? Bool
		if let _scheduledContruction = dictionary["SCHEDULEDCONSTRUCTIONEVENT"] as? [String : String] {
				scheduledConstructionEvent = SCHEDULEDCONSTRUCTIONEVENT(fromDictionary: _scheduledContruction)
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if eventItemCancelled != nil{
			dictionary["EVENTITEMCANCELLED"] = eventItemCancelled as AnyObject?
		}
		if let sCHEDULEDCONSTRUCTIONEVENT = scheduledConstructionEvent {
			dictionary["SCHEDULEDCONSTRUCTIONEVENT"] = sCHEDULEDCONSTRUCTIONEVENT.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
