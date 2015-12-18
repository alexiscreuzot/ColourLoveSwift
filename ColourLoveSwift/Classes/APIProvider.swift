//
//  APIProvider.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import Moya
import CocoaLumberjack

// MARK: - Provider setup

let ColourLoversProvider = MoyaProvider<ColourLovers>()

extension MoyaProvider {

    public func cl_request(target: Target, completion: Moya.Completion) -> Cancellable {
        DDLogInfo((target as! ColourLovers).description)
        return request(target, completion: completion)
    }

}

// MARK: - Provider support

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
}

public enum ColourLovers {
    case Colors(String)
    case Palettes(String)
    case Patterns(String)
}

extension ColourLovers: TargetType {
    public var baseURL: NSURL {
        return NSURL(string: "http://www.colourlovers.com/api")!
    }

    public var description: String {

        var desc = "\n----------->"
        desc    += "\nURL:"+self.baseURL.absoluteString+self.path
        if self.parameters != nil {
            desc    += "\nParameters:"+(self.parameters!.description)
        }

        return desc
    }

    public var path: String {
        switch self {
        case .Colors(_):
            return "/colors"
        case .Palettes(_):
            return "/palettes"
        case .Patterns(_):
            return "/patterns"
        }
    }

    public var method: Moya.Method {
        return .GET
    }

    public var parameters: [String: AnyObject]? {
        var parameters = ["format" : "json"]
        switch self {
        case .Colors(let search):
            parameters["keywords"] = search
            break
        case .Palettes(let search):
            parameters["keywords"] = search
            break
        case .Patterns(let search):
            parameters["keywords"] = search
            break
        }
        return parameters
    }

    public var sampleData: NSData {
        switch self {
        case .Colors:
            return "[]".dataUsingEncoding(NSUTF8StringEncoding)!
        case .Palettes:
            return "[]".dataUsingEncoding(NSUTF8StringEncoding)!
        case .Patterns:
            return "[]".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}
