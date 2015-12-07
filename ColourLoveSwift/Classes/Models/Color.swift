//
//  Color.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

// Todo, better object mapping

class Color: RLMObject{
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var usernName = ""
    dynamic var hex = ""
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    func uicolor() -> UIColor
    {
        return UIColor(hex: self.hex)
    }
    
}
