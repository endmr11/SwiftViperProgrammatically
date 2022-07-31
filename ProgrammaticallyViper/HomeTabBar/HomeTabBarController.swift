//
//  HomeTabBarController.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let homeViewController = HomeViewController()
        homeViewController.title = "Home"
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        let rootHomeNavController = UINavigationController(rootViewController: homeViewController)
        let rootProfileNavController = UINavigationController(rootViewController: profileViewController)
        self.setViewControllers([rootHomeNavController,rootProfileNavController], animated: true)
        guard let items = tabBar.items else {return}
        let images = ["house","person"]
        items[0].image = UIImage(systemName: images[0])
        items[1].image = UIImage(systemName: images[1])
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
    
    

}
