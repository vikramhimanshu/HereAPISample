//
//	LOCATION.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct LOCATION{

	var dEFINED : DEFINED?
	var gEOLOC : GEOLOC?
	var nAVTECH : NAVTECH?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		if let dEFINEDData = dictionary["DEFINED"] as? [String : AnyObject] {
            dEFINED = DEFINED(fromDictionary: dEFINEDData)
        }
		if let gEOLOCData = dictionary["GEOLOC"] as? [String : AnyObject] {
            gEOLOC = GEOLOC(fromDictionary: gEOLOCData)
        }
		if let nAVTECHData = dictionary["NAVTECH"] as? [String : AnyObject] {
            nAVTECH = NAVTECH(fromDictionary: nAVTECHData)
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let dEFINED = dEFINED {
			dictionary["DEFINED"] = dEFINED.toDictionary() as AnyObject?
		}
		if let gEOLOC = gEOLOC {
			dictionary["GEOLOC"] = gEOLOC.toDictionary() as AnyObject?
		}
		if let nAVTECH = nAVTECH {
			dictionary["NAVTECH"] = nAVTECH.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
