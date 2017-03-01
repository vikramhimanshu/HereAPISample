//
//	TRAFFICITEM.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct TRAFFICITEM {

	var aBBREVIATION : ABBREVIATION?
	var cOMMENTS : String?
	var cRITICALITY : CRITICALITY?
	var eNDTIME : String?
	var eNTRYTIME : String?
	var lOCATION : LOCATION?
	var oRIGINALTRAFFICITEMID : Double?
	var rDSTMCLOCATIONS : RDSTMCLOCATIONS?
	var sTARTTIME : String?
	var tRAFFICITEMDESCRIPTION : [DESCRIPTION]?
	var tRAFFICITEMDETAIL : TRAFFICITEMDETAIL?
	var tRAFFICITEMID : Double?
	var tRAFFICITEMSTATUSSHORTDESC : String?
	var tRAFFICITEMTYPEDESC : String?
	var vERIFIED : Bool?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String : AnyObject]) {
        if let aBBREVIATIONData = dictionary["ABBREVIATION"] as? [String : String] {
            aBBREVIATION = ABBREVIATION(fromDictionary: aBBREVIATIONData)
        }
		cOMMENTS = dictionary["COMMENTS"] as? String
		if let cRITICALITYData = dictionary["CRITICALITY"] as? [String : String] {
            cRITICALITY = CRITICALITY(fromDictionary: cRITICALITYData)
        }
		eNDTIME = dictionary["ENDTIME"] as? String
		eNTRYTIME = dictionary["ENTRYTIME"] as? String
		if let lOCATIONData = dictionary["LOCATION"] as? [String : AnyObject] {
            lOCATION = LOCATION(fromDictionary: lOCATIONData)
        }
		oRIGINALTRAFFICITEMID = dictionary["ORIGINALTRAFFICITEMID"] as? Double
		if let rDSTMCLOCATIONSData = dictionary["RDSTMCLOCATIONS"] as? [String : [[String : AnyObject]]] {
            rDSTMCLOCATIONS = RDSTMCLOCATIONS(fromDictionary: rDSTMCLOCATIONSData)
        }
		sTARTTIME = dictionary["STARTTIME"] as? String
		var _tRAFFICITEMDESCRIPTION = [DESCRIPTION]()
		if let tRAFFICITEMDESCRIPTIONArray = dictionary["TRAFFICITEMDESCRIPTION"] as? [[String : String]] {
			for dic in tRAFFICITEMDESCRIPTIONArray{
				let value = DESCRIPTION(fromDictionary: dic)
				_tRAFFICITEMDESCRIPTION.append(value)
			}
            tRAFFICITEMDESCRIPTION = _tRAFFICITEMDESCRIPTION
		}
		if let tRAFFICITEMDETAILData = dictionary["TRAFFICITEMDETAIL"] as? [String : AnyObject] {
            tRAFFICITEMDETAIL = TRAFFICITEMDETAIL(fromDictionary: tRAFFICITEMDETAILData)
        }
		tRAFFICITEMID = dictionary["TRAFFICITEMID"] as? Double
		tRAFFICITEMSTATUSSHORTDESC = dictionary["TRAFFICITEMSTATUSSHORTDESC"] as? String
		tRAFFICITEMTYPEDESC = dictionary["TRAFFICITEMTYPEDESC"] as? String
		vERIFIED = dictionary["VERIFIED"] as? Bool
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if let aBBREVIATION = aBBREVIATION {
			dictionary["ABBREVIATION"] = aBBREVIATION.toDictionary() as AnyObject?
		}
		if let cOMMENTS = cOMMENTS {
			dictionary["COMMENTS"] = cOMMENTS as AnyObject?
		}
		if let cRITICALITY = cRITICALITY {
			dictionary["CRITICALITY"] = cRITICALITY.toDictionary() as AnyObject?
		}
		if let eNDTIME = eNDTIME {
			dictionary["ENDTIME"] = eNDTIME as AnyObject?
		}
		if let eNTRYTIME = eNTRYTIME {
			dictionary["ENTRYTIME"] = eNTRYTIME as AnyObject?
		}
		if let lOCATION = lOCATION {
			dictionary["LOCATION"] = lOCATION.toDictionary() as AnyObject?
		}
		if let oRIGINALTRAFFICITEMID = oRIGINALTRAFFICITEMID {
			dictionary["ORIGINALTRAFFICITEMID"] = oRIGINALTRAFFICITEMID as AnyObject?
		}
		if let rDSTMCLOCATIONS = rDSTMCLOCATIONS {
			dictionary["RDSTMCLOCATIONS"] = rDSTMCLOCATIONS.toDictionary() as AnyObject?
		}
		if let sTARTTIME = sTARTTIME {
			dictionary["STARTTIME"] = sTARTTIME as AnyObject?
		}
		if let tRAFFICITEMDESCRIPTION = tRAFFICITEMDESCRIPTION {
			var dictionaryElements = [[String : String]]()
			for tRAFFICITEMDESCRIPTIONElement in tRAFFICITEMDESCRIPTION {
				dictionaryElements.append(tRAFFICITEMDESCRIPTIONElement.toDictionary())
			}
			dictionary["TRAFFICITEMDESCRIPTION"] = dictionaryElements as AnyObject?
		}
		if let tRAFFICITEMDETAIL = tRAFFICITEMDETAIL {
			dictionary["TRAFFICITEMDETAIL"] = tRAFFICITEMDETAIL.toDictionary() as AnyObject?
		}
		if let tRAFFICITEMID = tRAFFICITEMID {
			dictionary["TRAFFICITEMID"] = tRAFFICITEMID as AnyObject?
		}
		if let tRAFFICITEMSTATUSSHORTDESC = tRAFFICITEMSTATUSSHORTDESC {
			dictionary["TRAFFICITEMSTATUSSHORTDESC"] = tRAFFICITEMSTATUSSHORTDESC as AnyObject?
		}
		if let tRAFFICITEMTYPEDESC = tRAFFICITEMTYPEDESC {
			dictionary["TRAFFICITEMTYPEDESC"] = tRAFFICITEMTYPEDESC as AnyObject?
		}
		if let vERIFIED = vERIFIED {
			dictionary["VERIFIED"] = vERIFIED as AnyObject?
		}
		return dictionary
	}

}

extension TRAFFICITEM : Equatable {
    public static func ==(lhs: TRAFFICITEM, rhs: TRAFFICITEM) -> Bool {
        return lhs.oRIGINALTRAFFICITEMID == rhs.oRIGINALTRAFFICITEMID && lhs.tRAFFICITEMID == rhs.tRAFFICITEMID
    }
}
