//
//  Color.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import ObjectMapper

class Color: RLMObject, Mappable {

    dynamic var id = 0
    dynamic var title = ""
    dynamic var username = ""
    dynamic var hex = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    // PRAGMA - ObjectMapper

    required convenience init?(_ map: Map) {
        self.init()
    }

    static func mappedColor(dict: Dictionary<String, AnyObject>) -> Color {
        return Mapper<Color>().map(dict)! as Color
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        username <- map["userName"]
        hex <- map["hex"]
    }

    // PRAGMA - Misc

    func uicolor() -> UIColor {
        return UIColor(hex: self.hex)
    }
}
