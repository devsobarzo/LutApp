//
//  TabBarVC.swift
//  LutApp
//
//  Created by Rober on 05/09/23.
//

import UIKit

class TabBarVC: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
            
    }
    
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let spotifyVC = UINavigationController(rootViewController: SpotifyViewController())
        let drawVC = UINavigationController(rootViewController: DrawViewController())
        
        self.setViewControllers([homeVC, spotifyVC, drawVC], animated: true)
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .blue
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .green
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "music.mic.circle")
        items[2].image = UIImage(systemName: "hand.draw.fill")
    }
}



   


