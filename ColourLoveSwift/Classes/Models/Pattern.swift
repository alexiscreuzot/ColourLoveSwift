//
//  Pattern.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//
import ObjectMapper

class Pattern: RLMObject, Mappable {
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var username = ""
    dynamic var imageUrl = ""
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    // PRAGMA - ObjectMapper
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    static func mappedPattern(dict:Dictionary<String, AnyObject>) -> Pattern{
        return Mapper<Pattern>().map(dict)! as Pattern
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        username <- map["userName"]
        imageUrl <- map["imageUrl"]
    }
    
    // PRAGMA - Misc

}
