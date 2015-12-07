//
//  Realm+Extensions.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation
import Realm

extension RLMResults {
    func toArray () -> [RLMObject] {
        var array = [RLMObject]()
        for (var i:UInt = 0; i < self.count; i++){
            array.append(self.objectAtIndex(i))
        }
        return array
    }
}