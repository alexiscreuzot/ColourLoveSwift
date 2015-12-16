//
//  Constants.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import Alamofire

public struct Constants {
    public struct API{
        static let baseURL = "http://www.colourlovers.com/api"
        static let colorsURL = baseURL+"/colors"
        static let palettesURL = baseURL+"/palettes"
        static let patternsURL = baseURL+"/patterns"
    }
}

//extension URLRequestConvertible{
//    
//    public func request(
//        method: Alamofire.Method,
//        endpoint: Constants.API,
//        parameters: [String: AnyObject]? = nil)
//        -> Request
//    {
//        return Manager.sharedInstance.request(
//            method,
//            endpoint,
//            parameters: parameters,
//            encoding: .URL,
//            headers: nil
//        )
//    }
//}