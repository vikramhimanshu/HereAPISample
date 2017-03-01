//
//	ORIGIN.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct ORIGIN{

	var dIRECTION : DIRECTION?
	var pOINT : DIRECTION?
	var pROXIMITY : CRITICALITY?
	var rOADWAY : DIRECTION?
	var lATITUDE : Float?
	var lONGITUDE : Float?
	var eBUCOUNTRYCODE : String?
	var lOCATIONDESC : String?
	var lOCATIONID : String?
	var rDSDIRECTION : String?
	var tABLEID : Int?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
		if let dIRECTIONData = dictionary["DIRECTION"] as? [String : AnyObject] {
				dIRECTION = DIRECTION(fromDictionary: dIRECTIONData)
			}
		if let pOINTData = dictionary["POINT"] as? [String : AnyObject] {
				pOINT = DIRECTION(fromDictionary: pOINTData)
			}
		if let pROXIMITYData = dictionary["PROXIMITY"] as? [String : String] {
				pROXIMITY = CRITICALITY(fromDictionary: pROXIMITYData)
			}
		if let rOADWAYData = dictionary["ROADWAY"] as? [String : AnyObject] {
				rOADWAY = DIRECTION(fromDictionary: rOADWAYData)
			}
		lATITUDE = dictionary["LATITUDE"] as? Float
		lONGITUDE = dictionary["LONGITUDE"] as? Float
		eBUCOUNTRYCODE = dictionary["EBUCOUNTRYCODE"] as? String
		lOCATIONDESC = dictionary["LOCATIONDESC"] as? String
		lOCATIONID = dictionary["LOCATIONID"] as? String
		rDSDIRECTION = dictionary["RDSDIRECTION"] as? String
		tABLEID = dictionary["TABLEID"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let dIRECTION = dIRECTION {
			dictionary["DIRECTION"] = dIRECTION.toDictionary() as AnyObject?
		}
		if let pOINT = pOINT {
			dictionary["POINT"] = pOINT.toDictionary() as AnyObject?
		}
		if let pROXIMITY = pROXIMITY {
			dictionary["PROXIMITY"] = pROXIMITY.toDictionary() as AnyObject?
		}
		if let rOADWAY = rOADWAY {
			dictionary["ROADWAY"] = rOADWAY.toDictionary() as AnyObject?
		}
		if let lATITUDE = lATITUDE {
			dictionary["LATITUDE"] = lATITUDE as AnyObject?
		}
		if let lONGITUDE = lONGITUDE {
			dictionary["LONGITUDE"] = lONGITUDE as AnyObject?
		}
		if let eBUCOUNTRYCODE = eBUCOUNTRYCODE {
			dictionary["EBUCOUNTRYCODE"] = eBUCOUNTRYCODE as AnyObject?
		}
		if let lOCATIONDESC = lOCATIONDESC {
			dictionary["LOCATIONDESC"] = lOCATIONDESC as AnyObject?
		}
		if let lOCATIONID = lOCATIONID {
			dictionary["LOCATIONID"] = lOCATIONID as AnyObject?
		}
		if let rDSDIRECTION = rDSDIRECTION {
			dictionary["RDSDIRECTION"] = rDSDIRECTION as AnyObject?
		}
		if let tABLEID = tABLEID {
			dictionary["TABLEID"] = tABLEID as AnyObject?
		}
		return dictionary
	}

}
