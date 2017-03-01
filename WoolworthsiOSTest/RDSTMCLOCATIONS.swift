//
//	RDSTMCLOCATIONS.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct RDSTMCLOCATIONS{

	var rDSTMC : [RDSTMC]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : [[String : AnyObject]]]) {
		var _rDSTMC = [RDSTMC]()
		if let rDSTMCArray = dictionary["RDSTMC"] {
			for dic in rDSTMCArray{
				let value = RDSTMC(fromDictionary: dic)
				_rDSTMC.append(value)
			}
            rDSTMC = _rDSTMC
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : [[String : AnyObject]]]
	{
		var dictionary = [String : [[String : AnyObject]]]()
		if let rDSTMC = rDSTMC {
			var dictionaryElements = [[String : AnyObject]]()
			for rDSTMCElement in rDSTMC {
				dictionaryElements.append(rDSTMCElement.toDictionary())
			}
			dictionary["RDSTMC"] = dictionaryElements
		}
		return dictionary
	}

}
