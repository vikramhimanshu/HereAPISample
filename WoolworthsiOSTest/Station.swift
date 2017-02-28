//
//	Station.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct Station {

	var stn : [Stn]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : [[String : AnyObject]]]) {
		var stn = [Stn]()
        if let stnArray = dictionary["Stn"] {
			for dic in stnArray {
				let value = Stn(fromDictionary: dic)
				stn.append(value)
			}
            self.stn = stn
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : [[String : AnyObject]]]
	{
		var dictionary = [String : [[String : AnyObject]]]()
		if let stn = self.stn {
			var dictionaryElements = [[String : AnyObject]]()
			for stnElement in stn {
				dictionaryElements.append(stnElement.toDictionary())
			}
			dictionary["Stn"] = dictionaryElements
		}
		return dictionary
	}

}
