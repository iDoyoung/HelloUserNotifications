//
//  ViewController.swift
//  HelloAPNs
//
//  Created by Doyoung on 2022/01/06.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: 허용 요청
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            granted ? print("Allow") : print("NotAllow")
        }
    }

    private let notificationContent: UNMutableNotificationContent = {
        let content = UNMutableNotificationContent()
        content.title = "Hello Notification"
        content.body = "Study APNs with Apple developer doc"
        return content
    }()
    
    private let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
    
    @IBAction func pushNoti(_ sender: UIButton) {
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: notificationContent, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }
        }
    }
    
}
