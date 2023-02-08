//
//  ViewController.swift
//  CombineDemo
//
//  Created by Karamjit Singh on 07/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNotificationTrigger()
        // Do any additional setup after loading the view.
    }

    
    func getNotificationTrigger() {
        
        let notification = Notification.Name("MyNotfication")
         let publisher =  NotificationCenter.default.publisher(for: notification)
        
       
        
        let subscriber = publisher.sink { _ in
            print("Notification is triggered")
        }
        
        NotificationCenter.default.post(name: notification, object: nil)
        
        
    }

}

