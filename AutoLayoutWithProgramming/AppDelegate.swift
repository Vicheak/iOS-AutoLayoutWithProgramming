//
//  AppDelegate.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 5/5/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navController = UINavigationController(rootViewController: LoginViewController())
        navController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        navController.tabBarItem.badgeValue = "new"
        navController.tabBarItem.badgeColor = .red
        
        let navControllerForNoteList = UINavigationController(rootViewController: NoteListViewController())
        navControllerForNoteList.tabBarItem = UITabBarItem(title: "Note", image: UIImage(systemName: "list.bullet.clipboard"), tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController, navControllerForNoteList]
        tabBarController.selectedViewController = navController
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

