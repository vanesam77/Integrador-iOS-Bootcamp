//
//  TabBarController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .blue
        tabBar.tintColor = .white
        setupVCs()
        
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: ActivitiesViewController(), title: NSLocalizedString("Activities", comment: ""), image: UIImage(systemName: "list.dash")!),
            createNavController(for: RandomViewController(), title: NSLocalizedString("Random", comment: ""), image: UIImage(systemName: "shuffle")!),
        ]
        
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.navigationBar.backgroundColor = .systemTeal
        return navController
    }
    
}
