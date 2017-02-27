//
//  HereServices.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 27/02/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit

struct TransistRequest : HereAPIRequest {

    internal var url: URL {
        var components = EndPoints(with: .stationsNearby).urlcomponents
        components.queryItems = queryItems
        return components.url!
    }
    internal var queryItems: [URLQueryItem]?
    
    init(with lat: Double, long: Double, radius: Int = 350, max: Int = 5) {
        queryItems = Array()
        queryItems?.append(URLQueryItem(name: "y", value: String(lat)))
        queryItems?.append(URLQueryItem(name: "x", value: String(long)))
        queryItems?.append(URLQueryItem(name: "radius", value: String(radius)))
        queryItems?.append(URLQueryItem(name: "max", value: String(max)))
        queryItems?.append(contentsOf: defaultQueryItems())
    }
}

struct WeatherRequest : HereAPIRequest {
    enum Product : String {
        case observation
    }
    internal var url: URL {
        var components = EndPoints(with: .weatherAtLatLong).urlcomponents
        components.queryItems = queryItems
        return components.url!
    }
    internal var queryItems: [URLQueryItem]?

    init(with lat: Double, long: Double, oneobservation: Bool = true, product: Product = .observation) {
        queryItems = Array()
        queryItems?.append(URLQueryItem(name: "product", value: product.rawValue))
        queryItems?.append(URLQueryItem(name: "oneobservation", value: String(oneobservation)))
        queryItems?.append(URLQueryItem(name: "latitude", value: String(lat)))
        queryItems?.append(URLQueryItem(name: "longitude", value: String(long)))
        queryItems?.append(contentsOf: defaultQueryItems())
    }
}

struct TrafficRequest : HereAPIRequest {
    enum Criticality : Int {
        case critical = 0, major, minor, lowImpact
    }
    typealias Meters = Int
    
    internal var url: URL {
        var components = EndPoints(with: .traffic).urlcomponents
        components.queryItems = queryItems
        return components.url!
    }
    internal var queryItems: [URLQueryItem]?
    
    init(with lat: Double, long: Double, radius: Meters = 350, criticality: [Criticality] = [.critical, .major]) {
        queryItems = Array()
        let prox = "\(lat),\(long),\(radius)"
        var criticalityString = ""
        for item in criticality {
            criticalityString += "\(item.rawValue),"
        }
        if criticalityString.isEmpty {
            criticalityString = String(Criticality.major.rawValue)
        }
        queryItems?.append(URLQueryItem(name: "prox", value: prox))
        queryItems?.append(URLQueryItem(name: "criticality", value: criticalityString))
        queryItems?.append(contentsOf: defaultQueryItems())
    }
}

protocol ServicesProtocol {
    typealias SuccessBlock = (_ data: AnyObject) -> Void
    typealias FailureBlock = (_ responseType:Int, _ error: NSError?) -> Void

    var task: URLSessionDataTask? {get}
    func cancel()
    func fetch(request: HereAPIRequest, successHandler: @escaping SuccessBlock, and failureHandler: FailureBlock?)
}
