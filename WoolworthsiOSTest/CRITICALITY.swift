//
//	CRITICALITY.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

enum Criticality : Int {
    case minor = 2, major = 1, critical = 0, lowImpact = 3, unknown
}

struct CRITICALITY {

    var type : Criticality?
	var description : String?
	var id : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : String]) {
		description = dictionary["DESCRIPTION"]
		id = dictionary["ID"]
        if let i = id, let id_int = Int(i) {
            switch id_int {
            case 0:
                type = .critical
            case 1:
                type = .major
            case 2:
                type = .minor
            case 3:
                type = .lowImpact
            default:
                type = .unknown
                break
            }
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : String]
	{
		var dictionary = [String : String]()
		if description != nil{
			dictionary["DESCRIPTION"] = description
		}
		if id != nil{
			dictionary["ID"] = id
		}
		return dictionary
	}

}
