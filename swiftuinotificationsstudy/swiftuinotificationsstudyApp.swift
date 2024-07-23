//
//  swiftuinotificationsstudyApp.swift
//  swiftuinotificationsstudy
//
//  Created by kenan on 23.07.2024.
//

import SwiftUI

@main
struct swiftuinotificationsstudyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    
}


extension AppDelegate:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let app = UIApplication.shared
        if app.applicationState == .active{
            print("Foreground Notification clicked")
        }else{
            print("Background Notification clicked")
        }
        
        
        completionHandler()
    }
}
