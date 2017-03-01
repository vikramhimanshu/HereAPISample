//
//	ABBREVIATION.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct ABBREVIATION{

	var dESCRIPTIONField : String?
	var sHORTDESC : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : String]) {
		dESCRIPTIONField = dictionary["DESCRIPTION"]
		sHORTDESC = dictionary["SHORTDESC"]
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : String]
	{
		var dictionary = [String : String]()
		if dESCRIPTIONField != nil{
			dictionary["DESCRIPTION"] = dESCRIPTIONField
		}
		if sHORTDESC != nil{
			dictionary["SHORTDESC"] = sHORTDESC
		}
		return dictionary
	}

}
