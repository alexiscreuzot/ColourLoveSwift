//
//  AppDelegate.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import UIKit
import CocoaLumberjack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let ttyLogger = DDTTYLogger.sharedInstance()
        ttyLogger.colorsEnabled = true
        ttyLogger.setForegroundColor(UIColor.orangeColor(), backgroundColor: nil, forFlag: .Warning)
        ttyLogger.setForegroundColor(UIColor.redColor(), backgroundColor: nil, forFlag: .Error)
        ttyLogger.setForegroundColor(UIColor.cyanColor(), backgroundColor: nil, forFlag: .Info)
        ttyLogger.setForegroundColor(UIColor.greenColor(), backgroundColor: nil, forFlag: .Debug)
        ttyLogger.setForegroundColor(UIColor.magentaColor(), backgroundColor: nil, forFlag: .Verbose)
        DDLog.addLogger(ttyLogger)

        return true
    }

}
