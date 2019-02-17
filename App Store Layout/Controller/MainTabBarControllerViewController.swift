//
//  MainTabBarControllerViewController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/9/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//


import UIKit

class MainTabBarControllerViewController: UITabBarController {
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewControllers()
    }
    
    //MARK: Methods
    func addViewControllers() {
        let layout = UICollectionViewFlowLayout()
        let todayController = TodayController(collectionViewLayout: layout)
        let todayTabBar = navController(title: "Today", image: #imageLiteral(resourceName: "today_icon"), viewController: todayController)
        
        let appsController = AppsController()
        let appsTabBar = navController(title: "Apps", image: #imageLiteral(resourceName: "apps"), viewController: appsController)
        
        let searchBarController = SearchViewController()
        let searchTabBar = navController(title: "Search", image: #imageLiteral(resourceName: "search"), viewController: searchBarController)
        
        
        
        viewControllers = [
            todayTabBar,
            appsTabBar,
            searchTabBar
        ]
    }
    
    func navController(title: String, image: UIImage, viewController: UIViewController = UIViewController()) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
    
    
    
}
