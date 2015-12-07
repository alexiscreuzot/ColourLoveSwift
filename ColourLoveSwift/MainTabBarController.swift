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

        let colorNavController = UIStoryboard(name: StoryboardType.Colors.rawValue, bundle: nil).instantiateInitialViewController()
        let palettesNavController = UIStoryboard(name: StoryboardType.Palettes.rawValue, bundle: nil).instantiateInitialViewController()
        let patternsNavController = UIStoryboard(name: StoryboardType.Patterns.rawValue, bundle: nil).instantiateInitialViewController()
        
        self.viewControllers = [colorNavController!,palettesNavController!,patternsNavController!]
    }

}
