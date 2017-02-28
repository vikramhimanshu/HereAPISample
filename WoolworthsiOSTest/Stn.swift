//
//	Stn.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct Stn {

	var ccode : String!
	var city : String!
	var country : String!
	var distance : String!
	var district : String!
	var duration : String!
	var hasBoard : String!
	var id : String!
	var name : String!
	var number : String!
	var postal : String!
	var state : String!
	var street : String!
	var x : String!
	var y : String!
	var lines : Line!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]) {
		ccode = dictionary["@ccode"] as? String
		city = dictionary["@city"] as? String
		country = dictionary["@country"] as? String
		distance = dictionary["@distance"] as? String
		district = dictionary["@district"] as? String
		duration = dictionary["@duration"] as? String
		hasBoard = dictionary["@has_board"] as? String
		id = dictionary["@id"] as? String
		name = dictionary["@name"] as? String
		number = dictionary["@number"] as? String
		postal = dictionary["@postal"] as? String
		state = dictionary["@state"] as? String
		street = dictionary["@street"] as? String
		x = dictionary["@x"] as? String
		y = dictionary["@y"] as? String
		if let linesData = dictionary["Lines"] as? [String : AnyObject] {
				lines = Line(fromDictionary: linesData)
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
        
		if ccode != nil{
			dictionary["@ccode"] = ccode as AnyObject?
		}
		if city != nil{
			dictionary["@city"] = city as AnyObject?
		}
		if country != nil{
			dictionary["@country"] = country as AnyObject?
		}
		if distance != nil{
			dictionary["@distance"] = distance as AnyObject?
		}
		if district != nil{
			dictionary["@district"] = district as AnyObject?
		}
		if duration != nil{
			dictionary["@duration"] = duration as AnyObject?
		}
		if hasBoard != nil{
			dictionary["@has_board"] = hasBoard as AnyObject?
		}
		if id != nil{
			dictionary["@id"] = id as AnyObject?
		}
		if name != nil{
			dictionary["@name"] = name as AnyObject?
		}
		if number != nil{
			dictionary["@number"] = number as AnyObject?
		}
		if postal != nil{
			dictionary["@postal"] = postal as AnyObject?
		}
		if state != nil{
			dictionary["@state"] = state as AnyObject?
		}
		if street != nil{
			dictionary["@street"] = street as AnyObject?
		}
		if x != nil{
			dictionary["@x"] = x as AnyObject?
		}
		if y != nil{
			dictionary["@y"] = y as AnyObject?
		}
		if lines != nil{
			dictionary["Lines"] = lines.toDictionary() as AnyObject?
		}
		return dictionary
	}

}
