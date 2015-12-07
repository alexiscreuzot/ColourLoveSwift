//
//  Pattern.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//


class Pattern: RLMObject {
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var username = ""
    dynamic var imageUrl = ""
    
    override static func primaryKey() -> String?
    {
        return "id"
    }

}
