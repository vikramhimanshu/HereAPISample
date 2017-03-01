//
//	TransitRoot.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct TransitRoot{

	var res : Re?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		if let resData = dictionary["Res"] {
				res = Re(fromDictionary: resData as! [String : AnyObject])
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let res = res {
			dictionary["Res"] = res.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
