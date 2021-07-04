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
        
//        let NewsFeedVC = UIStoryboard(name: "NewsFeedViewController", bundle: nil).instantiateInitialViewController() as! UITabBarController
//        window?.rootViewController = NewsFeedVC
        let NewsFeedVC =  TabBarViewController()
        window?.rootViewController = NewsFeedVC
        print(#function)
        
    }
    
    func authServiceDidSignInFail() {
        print(#function)
        
    }
}

// https://api.vk.com/method/friends.get?count&access_token=bf1ddef97e24242a5e97a5ba4bdb401cce0d967ac56695ccd3a6a59b644e0f64452c458262d181afff8c7&v=5.131
