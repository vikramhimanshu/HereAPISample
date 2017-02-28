//
//  HereAPI.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 27/02/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit
import os.log

typealias SuccessHandler = (_ responseType:Int, _ data: AnyObject) -> Void
typealias FailureHandler = (_ responseType:Int, _ error: NSError?, _ response: URLResponse?) -> Void

class HereAPIManager: NSObject {
    
    internal let log = OSLog(subsystem: "com.woolworth._HereAPIManager", category: "_NETWORK_")
    
    public static let shared = HereAPIManager()
    private var sessionConfiguration: URLSessionConfiguration
    private weak var sessionDelegateQueue: OperationQueue?
    private let cookieStorage = HTTPCookieStorage.shared
    private let urlCache = URLCache.shared
    private var session: URLSession!
    
    override init() {
        let config = URLSessionConfiguration.default
        config.httpShouldSetCookies = true
        config.httpShouldUsePipelining = true
        config.sessionSendsLaunchEvents = true
        config.isDiscretionary = true
        config.shouldUseExtendedBackgroundIdleMode = true
        
        config.urlCredentialStorage = .shared
        config.httpCookieAcceptPolicy = .always
        config.requestCachePolicy = .returnCacheDataElseLoad
        
        config.timeoutIntervalForRequest = 60
        config.timeoutIntervalForResource = 120
        config.httpMaximumConnectionsPerHost = 4
        
        config.httpCookieStorage = cookieStorage
        config.urlCache = urlCache
        config.httpAdditionalHeaders = [
            "Content-Type": "application/json;charset=UTF-8"
        ]
        
        let _sessionDelegateQueue = OperationQueue()
        _sessionDelegateQueue.name = "HereAPIManager_URLSessionDelegate_OprtationQueue"
        sessionDelegateQueue = _sessionDelegateQueue
        sessionConfiguration = config
        
        super.init()
        session = URLSession(configuration: config, delegate: self, delegateQueue: _sessionDelegateQueue)
    }
    
    deinit {
        session.invalidateAndCancel()
    }
    
    func remoteFetch(with request: URLRequest, successHandler: @escaping SuccessHandler, and failureHandler: @escaping FailureHandler) -> URLSessionDataTask? {
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            //check if we have an error (error != nil)
            guard let responseError = error as? NSError else {
                //check if we have an response (response != nil)
                guard let urlResponse = response else {
                    //if we do not have an response (response == nil)
                    return failureHandler(NSURLErrorUnknown, nil, nil)
                }
                
                guard let d = data, !d.isEmpty else {
                    //we have a success response code from server data is nil or empty
                    return failureHandler(NSURLErrorZeroByteResource, nil, urlResponse)
                }
                
                if let httpResponse: HTTPURLResponse = (response as? HTTPURLResponse) {
                    switch httpResponse.statusCode {
                    case 200 :
                            do {
                                let json = try JSONSerialization.jsonObject(with: d, options: .allowFragments) as AnyObject
                                print(json, separator: "\t", terminator: "\n")
                                return successHandler(httpResponse.statusCode, json)
                            } catch let jsonError {
                                let serializationError = jsonError as NSError
                                var currentUserInfo = serializationError.userInfo
                                currentUserInfo["URLResponse"] = response?.debug()
                                currentUserInfo["data"] = d.debug()
                                let updatedSerializationError = NSError(domain: serializationError.domain, code: serializationError.code, userInfo: currentUserInfo)
                                print(d.debug(), separator: "\t", terminator: "\n")
                                return failureHandler(NSURLErrorCannotParseResponse, updatedSerializationError, urlResponse)
                            }
                    default:
                        var errorUserInfo = [String: Any]()
                        errorUserInfo["URLResponse"] = response
                        errorUserInfo["data"] = d.debug()
                        print(errorUserInfo, separator: "\t", terminator: "\n")
                        let error = NSError(domain: "au.com.woolworths", code: httpResponse.statusCode, userInfo: errorUserInfo)
                        return failureHandler(httpResponse.statusCode, error, urlResponse)
                    }
                } else {
                    return failureHandler(NSURLErrorUnknown, nil, urlResponse)
                }
            }
            
            let urlSessionError = responseError
            var currentUserInfo = urlSessionError.userInfo
            currentUserInfo["URLResponse"] = response
            currentUserInfo["data"] = data?.debug()
            let updatedURLSessionError = NSError(domain: urlSessionError.domain, code: urlSessionError.code, userInfo: currentUserInfo)
            
            failureHandler(responseError.code, updatedURLSessionError, response)
        }
        
        task.resume()
        return task
    }
}

extension HereAPIManager: URLSessionDelegate, URLSessionTaskDelegate {
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        print(metrics.transactionMetrics, separator: "\t", terminator: "\n")
        os_log("%@", log: log, type: .error, metrics)
    }
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("\n urlSession: didCompleteWithError: -->> \n \(task.originalRequest?.debug()) \n---" + (((error as? NSError)?.description) ?? "No Error"))
        os_log("%@", log: log, type: .error, (((error as? NSError)?.description) ?? "No Error"))
    }
}

extension URLResponse : DebugProtocol {
    
    func prettyPrint() {
        print(debug(), separator: " \t ", terminator: "\n\n\n")
    }
    
    func debug() -> String {
        
        var returnString = "\n\n\n"
        
        let httpResponse: HTTPURLResponse = (self as? HTTPURLResponse)!
        
        returnString.append("   Response URL: \n")
        returnString.append("\t")
        returnString.append(self.url?.absoluteString ?? "*** url?.absoluteString is nil")
        returnString.append("\n")
        returnString.append("   Response Type: \n")
        returnString.append("\t")
        if let mime = self.mimeType {
            returnString.append(mime)
        } else {
            returnString.append("Mime type is nil")
        }
        returnString.append("\n")
        returnString.append("   File Name: \n")
        returnString.append("\t")
        returnString.append(self.suggestedFilename ?? "** suggestedFilename is nil" )
        returnString.append("\n")
        returnString.append("   Response Status: ")
        returnString.append("\t")
        returnString.append(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
        returnString.append("\n")
        returnString.append("   Status Code: ")
        returnString.append("\t")
        returnString.append(String(httpResponse.statusCode))
        returnString.append("\n")
        returnString.append("   Response Headers: ")
        returnString.append("\n")
        for header in httpResponse.allHeaderFields {
            returnString.append("       \(header.key) : \(header.value)")
            returnString.append("\n")
        }
        return returnString
    }
}

extension URLRequest : DebugProtocol {
    
    func prettyPrint() {
        print(debug(), separator: " \t ", terminator: "\n\n\n")
    }
    
    func debug() -> String {
        
        var returnString = "\n\n\n"
        
        returnString.append("   Request URL: \n")
        returnString.append("\t ")
        returnString.append((self.url?.absoluteString)!)
        returnString.append("\n ")
        returnString.append("   Request Type: \n")
        returnString.append("\t ")
        returnString.append((self.httpMethod)!)
        returnString.append("\n ")
        returnString.append("   Should Handle Cookies: \n")
        returnString.append("\t ")
        returnString.append(String(self.httpShouldHandleCookies))
        returnString.append("\n ")
        returnString.append("   Request Body: ")
        returnString.append("\t ")
        let reqData = self.httpBody
        if reqData != nil {
            returnString.append(String(data: reqData!, encoding: String.Encoding.utf8)!)
        }
        returnString.append("\n ")
        returnString.append("   Request Headers: ")
        returnString.append("\n ")
        for header in self.allHTTPHeaderFields! {
            returnString.append("       \(header.key) : \(header.value)")
            returnString.append("\n ")
        }
        
        return returnString
    }
    
}

extension Data : DebugProtocol {
    func prettyPrint() {
        print(String(data: self, encoding: .utf8)!,
              separator: "\t",
              terminator: "\n")
    }
    
    func debug() -> String {
        return String(data: self, encoding: .utf8) ?? "** data is nil **"
    }
}

protocol DebugProtocol {
    func prettyPrint()
    func debug() -> String
}
