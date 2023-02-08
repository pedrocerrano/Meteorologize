//
//  AppDelegate.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.

        //MARK: - MOCK DATA
        CityController.sharedInstance.createCity(name: "Dallas", temp: 61.2, high: 63, low: 45, status: "Rainy")
        CityController.sharedInstance.createCity(name: "Fort Worth", temp: 60.3, high: 62, low: 44, status: "Cloudy")
        CityController.sharedInstance.createCity(name: "Lubbock", temp: 44.5, high: 44, low: 33, status: "Heavy clouds")
        CityController.sharedInstance.createCity(name: "Houston", temp: 100, high: 1000, low: 65, status: "Feels like Hell")
        
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

