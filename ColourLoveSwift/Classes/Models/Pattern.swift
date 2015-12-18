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
    dynamic var imageUrlString = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    // PRAGMA - ObjectMapper

    required convenience init?(_ map: Map) {
        self.init()
    }

    static func mappedPattern(dict: Dictionary<String, AnyObject>) -> Pattern {
        return Mapper<Pattern>().map(dict)! as Pattern
    }

    func imageURL() -> NSURL? {
        return NSURL(string: self.imageUrlString)
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        username <- map["userName"]
        imageUrlString <- map["imageUrl"]
    }

    // PRAGMA - Misc

}
