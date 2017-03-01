//
//	TRAFFICITEMS.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct TRAFFICITEMS {

	var trafficItem : [TRAFFICITEM]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String: [[String : AnyObject]]]) {
		var _trafficItem = [TRAFFICITEM]()
		if let tRAFFICITEMArray = dictionary["TRAFFICITEM"] {
			for dic in tRAFFICITEMArray {
				let value = TRAFFICITEM(fromDictionary: dic)
				_trafficItem.append(value)
			}
            self.trafficItem = _trafficItem
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String: [[String : AnyObject]]]
	{
		var dictionary = [String: [[String : AnyObject]]]()
		if let trafficItem = trafficItem {
			var dictionaryElements = [[String : AnyObject]]()
			for item in trafficItem {
                dictionaryElements.append(item.toDictionary())
			}
			dictionary["TRAFFICITEM"] = dictionaryElements
		}
		return dictionary
	}

}
