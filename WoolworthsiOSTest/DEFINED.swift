//
//	DEFINED.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct DEFINED{

	var origin : ORIGIN?
	var tO : ORIGIN?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		if let _origin = dictionary["ORIGIN"] as? [String : AnyObject] {
				origin = ORIGIN(fromDictionary: _origin)
			}
		if let _to = dictionary["TO"] as? [String : AnyObject] {
				tO = ORIGIN(fromDictionary: _to)
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let origin = origin {
			dictionary["ORIGIN"] = origin.toDictionary() as AnyObject?
		}
		if let tO = tO {
			dictionary["TO"] = tO.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
