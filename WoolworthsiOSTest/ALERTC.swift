//
//	ALERTC.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct ALERTC {

	var aLERTCDIRECTION : Int?
	var aLERTCDURATION : String?
	var dESCRIPTIONField : String?
	var dURATION : Int?
	var eXTENT : String?
	var pHRASECODE : String?
	var qUANTIFIERS : Int?
	var tRAFFICCODE : Int?
	var uPDATECLASS : Int?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		aLERTCDIRECTION = dictionary["ALERTCDIRECTION"] as? Int
		aLERTCDURATION = dictionary["ALERTCDURATION"] as? String
		dESCRIPTIONField = dictionary["DESCRIPTION"] as? String
		dURATION = dictionary["DURATION"] as? Int
		eXTENT = dictionary["EXTENT"] as? String
		pHRASECODE = dictionary["PHRASECODE"] as? String
		qUANTIFIERS = dictionary["QUANTIFIERS"] as? Int
		tRAFFICCODE = dictionary["TRAFFICCODE"] as? Int
		uPDATECLASS = dictionary["UPDATECLASS"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if aLERTCDIRECTION != nil{
			dictionary["ALERTCDIRECTION"] = aLERTCDIRECTION as AnyObject?
		}
		if aLERTCDURATION != nil{
			dictionary["ALERTCDURATION"] = aLERTCDURATION as AnyObject?
		}
		if dESCRIPTIONField != nil{
			dictionary["DESCRIPTION"] = dESCRIPTIONField as AnyObject?
		}
		if dURATION != nil{
			dictionary["DURATION"] = dURATION as AnyObject?
		}
		if eXTENT != nil{
			dictionary["EXTENT"] = eXTENT as AnyObject?
		}
		if pHRASECODE != nil{
			dictionary["PHRASECODE"] = pHRASECODE as AnyObject?
		}
		if qUANTIFIERS != nil{
			dictionary["QUANTIFIERS"] = qUANTIFIERS as AnyObject?
		}
		if tRAFFICCODE != nil{
			dictionary["TRAFFICCODE"] = tRAFFICCODE as AnyObject?
		}
		if uPDATECLASS != nil{
			dictionary["UPDATECLASS"] = uPDATECLASS as AnyObject?
		}
		return dictionary
	}

}
