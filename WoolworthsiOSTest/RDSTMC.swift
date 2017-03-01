//
//	RDSTMC.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct RDSTMC {

	var aLERTC : ALERTC?
	var dIRECTION : String?
	var oRIGIN : ORIGIN?
	var tO : TO?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]) {
		if let aLERTCData = dictionary["ALERTC"] as? [String : AnyObject] {
            aLERTC = ALERTC(fromDictionary: aLERTCData)
        }
		dIRECTION = dictionary["DIRECTION"] as? String
		if let oRIGINData = dictionary["ORIGIN"] as? [String : AnyObject] {
            oRIGIN = ORIGIN(fromDictionary: oRIGINData)
        }
		if let tOData = dictionary["TO"] as? [String : AnyObject] {
            tO = TO(fromDictionary: tOData)
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let aLERTC = aLERTC {
			dictionary["ALERTC"] = aLERTC.toDictionary() as AnyObject?
		}
		if let dIRECTION = dIRECTION {
			dictionary["DIRECTION"] = dIRECTION as AnyObject?
		}
		if let oRIGIN = oRIGIN {
			dictionary["ORIGIN"] = oRIGIN.toDictionary() as AnyObject?
		}
		if let tO = tO {
			dictionary["TO"] = tO.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
