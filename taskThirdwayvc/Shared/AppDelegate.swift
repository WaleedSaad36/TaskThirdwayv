//
//  AppDelegate.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 10/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NetWorkMonitor.shared.startMonitoring()
        return true
    }
    
    
}

