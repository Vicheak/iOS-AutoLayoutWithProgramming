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
        
//        let navController = UINavigationController(rootViewController: LoginViewController())
//        navController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
//        navController.tabBarItem.badgeValue = "new"
//        navController.tabBarItem.badgeColor = .red
//        
//        let navControllerForNoteList = UINavigationController(rootViewController: NoteListViewController())
//        navControllerForNoteList.tabBarItem = UITabBarItem(title: "Note", image: UIImage(systemName: "list.bullet.clipboard"), tag: 0)
        
        let navController = UINavigationController(rootViewController: CreateNoteViewController())
        navController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0);
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let collectionNavViewController = storyBoard.instantiateViewController(withIdentifier: "CollectionNavigationController")
        collectionNavViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController, collectionNavViewController]
        tabBarController.selectedViewController = navController
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

