//
//  AppTabBarController.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import UIKit

public final class AppTabBarController: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        let viewControllers = [createFirstView()]
        setViewControllers(viewControllers, animated: true)
    }

    private func createFirstView() -> UINavigationController {
        let vc = FirstViewController.instantiate(in: Bundle.appViewModule)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "house"), tag: 0)
        return navController
    }
}
