//
//  Palette.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//


class Palette: RLMObject {
    dynamic var id = 0
    dynamic var title = ""
    dynamic var username = ""
    dynamic var imageUrl = ""
    
    var selected:Bool = false
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    override static func ignoredProperties() -> [AnyObject]?{
        return ["selected"]
    }
    
}
