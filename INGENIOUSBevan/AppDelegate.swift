//
//  AppDelegate.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setBackNavigationImage()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let rootVc = UINavigationController(rootViewController: LoginViewController())
        rootVc.view.backgroundColor = .white
                                        
        window?.rootViewController = rootVc
        window?.makeKeyAndVisible()
     
        
        return true
    }
    
    func setBackNavigationImage() {
        let backImage = UIImage(named: "icon_back")
        // to remove back title
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -200, vertical: 0), for: .default)
        
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UINavigationBar.appearance().tintColor = .gray // set the tint color of the back button image
    }
}
