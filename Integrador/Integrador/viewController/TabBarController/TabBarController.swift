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
        tabBar.tintColor = UIColor(named: "boredAccentColor")
        tabBar.barTintColor = UIColor(named: "boredMediumColor")
        tabBar.unselectedItemTintColor = .darkGray
    }
    
}
