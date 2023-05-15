//
//  SceneDelegate.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import Foundation
import UIKit

@available(iOS 13.0, *)

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

       func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
           
           guard let windowScene = (scene as? UIWindowScene) else { return }
           setBackNavigationImage()
           // Instantiate the UIWindow
           window = UIWindow(windowScene: windowScene)
           let rootVc = UINavigationController(rootViewController: LoginViewController())
           rootVc.view.backgroundColor = .white
           window?.rootViewController = rootVc
           window?.makeKeyAndVisible()
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
