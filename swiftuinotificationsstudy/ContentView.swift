//
//  ContentView.swift
//  swiftuinotificationsstudy
//
//  Created by kenan on 23.07.2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: 
                                                                    [.alert,.badge,.sound] ){success,error in
            if success {
                print("Noticication Permission Granted")
            }else{
                print("Noticication Permission Denied")
            }
            
        
        }
    }
    
    var body: some View {
        VStack {
            Button("CREATE NOTIFICATION"){
                let content = UNMutableNotificationContent()
                content.title = "HEADING"
                content.subtitle = "SUBTITLE"
                content.body = "BODY"
                content.badge = 5
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                //tekrarlı bildirimlerde timeınterval süresi en az 60 saniye olmalı
                let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
        .onAppear{
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
