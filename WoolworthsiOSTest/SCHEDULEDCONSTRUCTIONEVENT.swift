//
//	SCHEDULEDCONSTRUCTIONEVENT.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct SCHEDULEDCONSTRUCTIONEVENT{

	var sCHEDULEDCONSTRUCTIONDETAIL : String?
	var sCHEDULEDCONSTRUCTIONTYPEDESC : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : String]) {
		sCHEDULEDCONSTRUCTIONDETAIL = dictionary["SCHEDULEDCONSTRUCTIONDETAIL"]
		sCHEDULEDCONSTRUCTIONTYPEDESC = dictionary["SCHEDULEDCONSTRUCTIONTYPEDESC"]
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : String]
	{
		var dictionary = [String : String]()
		if sCHEDULEDCONSTRUCTIONDETAIL != nil{
			dictionary["SCHEDULEDCONSTRUCTIONDETAIL"] = sCHEDULEDCONSTRUCTIONDETAIL
		}
		if sCHEDULEDCONSTRUCTIONTYPEDESC != nil{
			dictionary["SCHEDULEDCONSTRUCTIONTYPEDESC"] = sCHEDULEDCONSTRUCTIONTYPEDESC
		}
		return dictionary
	}

}
