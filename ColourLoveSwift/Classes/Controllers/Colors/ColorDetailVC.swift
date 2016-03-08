//
//  ColorDetailVC.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import UIKit

class ColorDetailVC: UIViewController {

    var color = Color()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = color.title
        self.view.backgroundColor = color.uicolor()
    }

}
