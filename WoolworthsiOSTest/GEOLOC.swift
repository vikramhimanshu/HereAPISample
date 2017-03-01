//
//	GEOLOC.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct GEOLOC{

	var origin : ORIGIN?
	var to : [TO]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]) {
		if let _origin = dictionary["ORIGIN"] as? [String : AnyObject] {
				origin = ORIGIN(fromDictionary: _origin)
			}
		var toArr = [TO]()
		if let toArray = dictionary["TO"] as? [[String : AnyObject]] {
			for dic in toArray {
				let value = TO(fromDictionary: dic)
				toArr.append(value)
			}
            to = toArr
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let _origin = origin {
			dictionary["ORIGIN"] = _origin.toDictionary() as AnyObject?
		}
		if let _to = to {
			var dictionaryElements = [[String : AnyObject]]()
			for item in _to {
				dictionaryElements.append(item.toDictionary())
			}
			dictionary["TO"] = dictionaryElements as AnyObject?
		}
		return dictionary
	}

}
