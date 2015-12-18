//
//  Palette.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//
import ObjectMapper

class Palette: RLMObject, Mappable {
    dynamic var id = 0
    dynamic var title = ""
    dynamic var username = ""
    dynamic var imageUrlString = ""

    dynamic var selected: Bool = false

    override static func primaryKey() -> String? {
        return "id"
    }

    // PRAGMA - ObjectMapper

    required convenience init?(_ map: Map) {
        self.init()
    }

    static func mappedPalette(dict: Dictionary<String, AnyObject>) -> Palette {
        return Mapper<Palette>().map(dict)! as Palette
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
}
