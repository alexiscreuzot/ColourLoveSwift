//
//  MainTabBarController.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let colorNavController = UIStoryboard(type:.Colors).instantiateInitialViewController()
        let palettesNavController = UIStoryboard(type:.Palettes).instantiateInitialViewController()
        let patternsNavController = UIStoryboard(type: .Patterns).instantiateInitialViewController()

        self.viewControllers = [colorNavController!, palettesNavController!, patternsNavController!]
    }
}
