//
//  EndPoints.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 27/02/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import Foundation
struct EndPoints {
    
    enum ServiceType: String {
        case weatherAtLatLong, stationsNearby, traffic
    }
    
    private(set) var urlcomponents: URLComponents
    private let hostSuffix: String
    
    init(with type: ServiceType) {
        urlcomponents = URLComponents()
        urlcomponents.scheme = "https"
        hostSuffix = "api.here.com"
        compose(with: type)
    }
    
//    https://weather.cit.api.here.com/weather/1.0/report.json
//    https://traffic.cit.api.here.com/traffic/6.0/incidents.json
//    https://cit.transit.api.here.com/search/by_geocoord.json

    private mutating func compose(with type: ServiceType) {
        switch type {
        case .stationsNearby:
            urlcomponents.host = "cit.transit.".appending(hostSuffix)
            urlcomponents.path = "/search/by_geocoord.json"
            
        case .weatherAtLatLong:
            urlcomponents.host = "weather.cit.".appending(hostSuffix)
            urlcomponents.path = "/weather/1.0/report.json"
            
        case .traffic:
            urlcomponents.host = "traffic.cit.".appending(hostSuffix)
            urlcomponents.path = "/traffic/6.0/incidents.json"
        }
    }
}

protocol HereAPIRequest {
    var queryItems: [URLQueryItem]? {get set}
    var url: URL {get}
}

extension HereAPIRequest {
//    iOS SDK
    //sC1KFSHbJxRcZvXSgJP8
    //l-NdHFgoIn3BOkUGBoERnQ

    mutating func defaultQueryItems() -> [URLQueryItem] {
        var queryParams = [URLQueryItem]()
        queryParams.append(URLQueryItem(name: "app_id", value: "Izya3Dpb1nJO9Xmko6wV"))
        queryParams.append(URLQueryItem(name: "app_code", value: "wo6oZXfb2xRSScyZ3BUkXQ"))
        return queryParams
    }
    
    //OLD
    //cgRQ5yJkaMyTaG2pemaf
    //GQ4ciX3eIKEKD1Ttkc_Plg
}
