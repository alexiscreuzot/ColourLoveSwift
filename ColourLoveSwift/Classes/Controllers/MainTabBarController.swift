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

        let colorNavController = StoryboardScene.Colors.initialViewController()
        let palettesNavController = StoryboardScene.Palettes.initialViewController()
        let patternsNavController = StoryboardScene.Patterns.initialViewController()

        self.viewControllers = [colorNavController, palettesNavController, patternsNavController]
    }
}
