//
//  AppDelegate.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import UIKit
import VK_ios_sdk

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AuthServiceDelegate {

    
    // window
var window: UIWindow?

    var authService: AuthService!

    static func shared() -> AppDelegate {
     return UIApplication.shared.delegate as! AppDelegate

    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
window = UIWindow()
        self.authService = AuthService()
        authService.delegate = self
        let authVC = UIStoryboard(name: "AuthViewController", bundle: nil).instantiateInitialViewController() as! AuthViewController
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
    // Mark AuthServiceDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)

    }
    
    func authServiceSignIn() {
        let feedVC = UIStoryboard(name: "FeedViewController", bundle: nil).instantiateInitialViewController() as! FeedViewController
        let navVC = UINavigationController(rootViewController: feedVC)
        window?.rootViewController = navVC
        print(#function)

    }
    
    func authServiceDidSignInFail() {
        print(#function)

    }
}

