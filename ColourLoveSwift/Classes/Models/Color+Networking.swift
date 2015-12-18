//
//  Color+Networking.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import Alamofire
import CocoaLumberjack

extension Color {

    static func fetch(keywords: String, completion:(result: [RLMObject]?, error: NSError?) -> Void) {
        ColourLoversProvider.cl_request(.Colors(keywords), completion: { result in
            switch result {
            case .Success(let response):
                do {
                    let json = try response.mapJSON() as? NSArray
                    Color.parseColorsJSON(json as! Array<[String : AnyObject]>)
                    completion(result:Color.allObjects().toArray(), error: nil)
                } catch {
                    completion(result:nil, error: NSError(domain: "Data", code: 0, userInfo: [NSLocalizedDescriptionKey:"Parsing Error"]))
                }
            case  .Failure(_):
                completion(result:nil, error: NSError(domain: "Network", code: 0, userInfo: [NSLocalizedDescriptionKey:"Network Error"]))
            }
        })
    }

    static func parseColorsJSON(json: Array<[String: AnyObject]>) {
        let realm = RLMRealm.defaultRealm()
        do {
            try realm.transactionWithBlock {
                realm.deleteObjects(Color.allObjects())
                for dict in json {
                    let col = Color.mappedColor(dict)
                    realm.addOrUpdateObject(col)
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }
}
