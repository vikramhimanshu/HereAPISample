//
//  TrafficDetailTableViewCellViewModel.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 2/03/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit

struct TrafficDetailTableViewCellViewModel {
    
    private var trafficItem: TRAFFICITEM
    
    init(withTrafficItem item: TRAFFICITEM) {
        trafficItem = item
    }
    
    func color() -> UIColor {
        if let ct = trafficItem.cRITICALITY?.type {
            switch ct {
            case .critical:
                return .red
            case .major:
                return .orange
            case .minor:
                return .yellow
            case .lowImpact:
                return .green
            default:
                return .darkGray
            }
        }
        return .purple
    }
    
    func criticality() -> String {
        if let desc = trafficItem.cRITICALITY?.description {
            return desc
        }
        return "NA"
    }
    
    func status() -> String {
        if let _status = trafficItem.tRAFFICITEMSTATUSSHORTDESC {
            return _status
        }
        return "NA"
    }
    
    func comments() -> String {
        if let desc = trafficItem.cOMMENTS {
            return desc
        }
        return "NA"
    }
    
    func shortDesc() -> String {
        if let desc = trafficItem.tRAFFICITEMTYPEDESC {
            return desc
        }
        return "NA"
    }
    
    func desc() -> String {
        let _desc = trafficItem.tRAFFICITEMDESCRIPTION?.filter { $0.type == "desc" }
        if let returnVal = _desc?.last?.content {
            return returnVal
        }
        return "NA"
    }
}
