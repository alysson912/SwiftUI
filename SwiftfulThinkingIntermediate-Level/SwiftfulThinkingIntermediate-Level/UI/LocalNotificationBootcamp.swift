//
//  LocalNotificationBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 19/04/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first Notification!"
        content.subtitle = "This was soooo easy"
        content.sound = .default
        content.badge = 1
        
        //MARK: tipos de gatilhos
        //time - % seg após definir o agendamento da  notificação
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //calendar // notificaçao dispara todos os dias no horario definido a baixo
//        var dateComponents = DateComponents()
//        dateComponents.hour = 16
//        dateComponents.minute = 50
//        dateComponents.weekday = 6 // dia da semana
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        //location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 50,
            identifier: UUID().uuidString)
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    // disable notificações agendadas
    func  cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}


struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40){
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("Agendar Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0 // Will be Deprecated ios 17
          //  UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    LocalNotificationBootcamp()
}
