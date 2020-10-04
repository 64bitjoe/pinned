//
//  AppDelegate.swift
//  TodayExtension
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
       if shortcutItem.type == "us.joeis.Home" {
         let myAddress = "31,Arden+St,New+Haven,CT,06512,USA"
        if let url = URL(string:"http://maps.apple.com/?address=\(myAddress)") {
            UIApplication.shared.open(url)
        }
        
        
        } else if shortcutItem.type == "us.joeis.Starbucks" {
        
         let myAddress = "6,North+Main+St,Branfrod,CT,06405,USA"
            let adress0 =  UserDefaults.standard.object(forKey: "spot0name") as! String
        if let url = URL(string:"http://maps.apple.com/daddr=\(myAddress)") {
            UIApplication.shared.open(url)
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                // Fallback on earlier versions
            }
        }
    
       } else if shortcutItem.type == "us.joeis.Apple" {
        
         let myAddress = "100,Howe+St,New+Haven,CT,06511,USA"
        if let url = URL(string:"http://maps.apple.com/?address=\(myAddress)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                // Fallback on earlier versions
            }
        }
        
    }

}

}
