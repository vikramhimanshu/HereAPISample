//
//	Line.swift
//
//	Created by Tantia H <himanshu@kreativapps.com> on 28/2/2017
//	Copyright © 2017 Kreativ Apps,LLC <www.kreativapps.com>. All rights reserved.
//

import Foundation

struct Line{

	var code : String?
	var dir : String?
	var name : String?
	var at : [At]?
	var line : [Line]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String : AnyObject]){
		code = dictionary["@code"] as? String
		dir = dictionary["@dir"] as? String
		name = dictionary["@name"] as? String
		var at = [At]()
        if let atArray = dictionary["At"] as? [[String : String]] {
			for dic in atArray{
				let value = At(fromDictionary: dic)
				at.append(value)
			}
            self.at = at
		}
		var line = [Line]()
		if let lineArray = dictionary["Line"] as? [[String : AnyObject]] {
			for dic in lineArray{
				let value = Line(fromDictionary: dic)
				line.append(value)
			}
            self.line = line
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String : AnyObject]
	{
		var dictionary = [String : AnyObject]()
		if code != nil{
			dictionary["@code"] = code as AnyObject?
		}
		if dir != nil{
			dictionary["@dir"] = dir as AnyObject?
		}
		if name != nil{
			dictionary["@name"] = name as AnyObject?
		}
		if let at = self.at {
			var dictionaryElements = [[String : String]]()
			for atElement in at {
				dictionaryElements.append(atElement.toDictionary())
			}
			dictionary["At"] = dictionaryElements as AnyObject?
		}
		if let line = self.line {
			var dictionaryElements = [[String : AnyObject]]()
			for lineElement in line {
				dictionaryElements.append(lineElement.toDictionary())
			}
			dictionary["Line"] = dictionaryElements as AnyObject?
		}
		return dictionary
	}

}
