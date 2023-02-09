//
//  ViewController.swift
//  CombineDemo
//
//  Created by Karamjit Singh on 07/02/23.
//

import UIKit
import Combine


enum SubscriberError: Error {
    case subscriberError
    
}

class stringSubscriber: Subscriber {
   
    typealias Input = String
    
    typealias Failure = SubscriberError
    
  
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
        
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value: \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<SubscriberError>) {
        print("Completed")
    }
    
    
    
    
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // getNotificationTrigger()
        
        
        let publisher = ["a","b","c","d", "e", "f"].publisher
      //  publisher.sink { value in
      //      print(value)
      //  }
        
        
        
        let subjectTypeEraser = PassthroughSubject<String, SubscriberError>().eraseToAnyPublisher()
        
        
        let subscriber = stringSubscriber()
        
        let subject = PassthroughSubject<String, SubscriberError>()
        
        subject.subscribe(subscriber)
       // publisher.subscribe(subscriber)
        
        let subscription = subject.sink { completion in
            print("completion Value from sink")
        } receiveValue: { value in
            print("Recieved Sink")
        }

        
        subject.send("A")
        subject.send("B")
        
        
        subscription.cancel()
        subject.send("C")
        
        
        
        
        
        
       
        
        
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

