//
//  TabBarViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 4.07.21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}
// Mark
// Mark - configure
private extension TabBarViewController {
    func configure() {
        configureViewController()
    }
    
    func configureViewController() {
        
        guard let ProfileImage = UIImage(named: "user") else {
            return
        }
        guard let NewsFeedImage = UIImage(named: "home") else {
            return
        }
        
        let ProfileViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let ProfileTabBarItem = UITabBarItem()
        ProfileTabBarItem.title = "Today"
        ProfileTabBarItem.image = ProfileImage.withRenderingMode(.alwaysOriginal)
        ProfileViewController.tabBarItem = ProfileTabBarItem
        
        let NewsFeedViewController = UIStoryboard(name: "NewsFeed", bundle: nil) .instantiateInitialViewController() as! UINavigationController
        let NewsFeedTabBarItem = UITabBarItem()
        NewsFeedTabBarItem.title = "Forecast"
        NewsFeedTabBarItem.image = NewsFeedImage.withRenderingMode(.alwaysOriginal)
        NewsFeedViewController.tabBarItem = NewsFeedTabBarItem
        
        viewControllers = [NewsFeedViewController, ProfileViewController]
    }
    
}
