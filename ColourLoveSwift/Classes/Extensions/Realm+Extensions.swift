//
//  Realm+Extensions.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import Realm
import ObjectMapper

extension RLMResults {
    func toArray () -> [RLMObject] {
        var array = [RLMObject]()
        for i in 0...self.count {
            array.append(self.objectAtIndex(i))
        }
        return array
    }
}
