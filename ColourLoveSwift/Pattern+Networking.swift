//
//  Pattern+Networking.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import Alamofire

extension Pattern{
    
    static func fetch(keywords: String, completion:(result: [RLMObject]?, error: NSError?) -> Void)
    {
        let parameters:Dictionary = ["format":"json", "keywords" : keywords]
        Alamofire.request(.GET, Constants.API.patternsURL, parameters:parameters).responseJSON { response in
            print(response.response) // URL response
            
            if((response.result.error) != nil){
                completion(result:nil,error: response.result.error)
            }else{
                if let JSON:Array = response.result.value as? Array<[String: AnyObject]> {
                    let realm = RLMRealm.defaultRealm()
                    do{
                        try realm.transactionWithBlock {
                            realm.deleteObjects(Pattern.allObjects())
                            for dict in JSON{
                                Pattern.createOrUpdateInDefaultRealmWithValue(dict)
                            }
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                    completion(result:Pattern.allObjects().toArray(),error: response.result.error)
                }else{
                    completion(result:nil,error: NSError(domain: "Data", code: 0, userInfo: [NSLocalizedDescriptionKey:"Parsing Error"]))
                }
            }
        }
    }
    
}