//
//  TabBarController.swift
//  News
//
//  Created by Muhammed Yılmaz on 2.07.2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
    }
    
    private func setupTabs() {
        
        let home = createNav(with: "News", and: UIImage(systemName: "newspaper.fill"), vc: HomeViewController())
        let settings = createNav(with: "Settings", and: UIImage(systemName: "gear"), vc: SettingsViewController())

        self.setViewControllers([home, settings], animated: false)
        
        
    }
    
    func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        vc.title = title
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationItem.largeTitleDisplayMode = .always
        
        return nav
    }

}
