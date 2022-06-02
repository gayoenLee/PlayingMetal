//
//  RootViewController.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/11.
//

import Foundation
import UIKit
import Then

final class RootViewController : UITabBarController {
    
    override func viewDidLoad() {
        print("rootviewController viewDidLoad")
        super.viewDidLoad()
        setupTabBar()
        setupTabBarViewControllers()
    }
    
    private func setupTabBar(){
        self.tabBar.do{
            $0.barTintColor = .white
            $0.isTranslucent = false
            $0.tintColor = .primary1
            $0.unselectedItemTintColor = .monogrey1
        }
    }
    
    
    private func setupTabBarViewControllers(){
        let viewControllers = [homeViewController, carViewController]
        self.setViewControllers(viewControllers, animated: false)
    }
    
    private lazy var homeViewController: UINavigationController = {
        let homeViewModel = HomeViewModel()
        let homeVC = HomeViewController(viewModel: homeViewModel).then{
            $0.tabBarItem = UITabBarItem(title: "", image: UIImage(named: ""), selectedImage: nil)
        }
        let navigationController = UINavigationController(rootViewController: homeVC)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    private lazy var carViewController: UINavigationController = {
        let carViewModel = CarViewModel()
        let carViewController = CarViewController(viewModel: carViewModel).then {
            $0.tabBarItem = UITabBarItem(title: "Car", image: nil, selectedImage: nil)
        }
        return UINavigationController(rootViewController: carViewController)
    }()
}
