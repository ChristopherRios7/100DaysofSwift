//
//  ContentView.swift
//  HotProspects
//
//  Created by Christopher Rios on 11/2/23.
//

import SwiftUI
import SamplePackage
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                //first
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All Set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                //second
                let content = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They look hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}
    

#Preview {
    ContentView()
}
