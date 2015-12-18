//
//  APIProvider.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import CocoaLumberjack
import Alamofire


public enum API {
    case Colors
    case Palettes
    case Patterns
}

extension API {

    public var baseURL: String {
        return "http://colourlovers.com/api"
    }

    public var path: String {
        switch self {
        case .Colors:
            return baseURL+"/colors"
        case .Palettes:
            return baseURL+"/palettes"
        case .Patterns:
            return baseURL+"/patterns"
        }
    }

    public static func request(
        method: Alamofire.Method,
        endpoint: API,
        var parameters: [String: AnyObject]?,
        completionHandler: Response<AnyObject, NSError> -> Void)
        -> Request {

        // endpoint
        DDLogInfo("----> " + endpoint.path)

        // Parameters
        if parameters!["format"] == nil {
            parameters!["format"] = "json"
        }

        let request =  Manager.sharedInstance.request(
            method,
            endpoint.path,
            parameters: parameters,
            encoding: .URL,
            headers: nil
        ).responseJSON { response in

            if (response.result.error) != nil {
                DDLogError(response.result.error!.description)
                completionHandler(response)
            } else {
                DDLogInfo(response.response!.description)
                completionHandler(response)
            }
        }

        return request
    }
}
