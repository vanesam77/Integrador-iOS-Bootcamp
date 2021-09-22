//
//  TabBarController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

class TabBarController: UITabBarController {
    
//    var participant: Int?
//
//    init(participant: Int?) {
//        self.participant = participant
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .blue
        tabBar.tintColor = .white
        //setupVCs()
    }
}
