//
//	DIRECTION.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct DIRECTION{

	var description : [DESCRIPTION]?
	var id : Int?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		var desc = [DESCRIPTION]()
		if let dESCRIPTIONFieldArray = dictionary["DESCRIPTION"] as? [[String : String]]{
			for dic in dESCRIPTIONFieldArray{
				let value = DESCRIPTION(fromDictionary: dic)
				desc.append(value)
			}
            description = desc
		}
		id = dictionary["ID"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let description = description {
			var dictionaryElements = [[String : String]]()
			for desc in description {
				dictionaryElements.append(desc.toDictionary())
			}
			dictionary["DESCRIPTION"] = dictionaryElements as AnyObject?
		}
		if id != nil{
			dictionary["ID"] = id as AnyObject?
		}
		return dictionary
	}

}
