//
//  UIStoryboard+Extensions.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import Foundation

enum StoryboardType: String {
    case Colors
    case Palettes
    case Patterns
}

extension UIStoryboard {

    convenience init(type: StoryboardType) {
        self.init(name: type.rawValue, bundle: nil)
    }

}
