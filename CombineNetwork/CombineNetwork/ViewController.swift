//
//  ViewController.swift
//  CombineNetwork
//
//  Created by Karamjit Singh on 11/02/23.
//

import UIKit
import Combine
class ViewController: UIViewController {

   private var httpRequest = HttpRequest()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.cancellable = httpRequest.getPost().sink(receiveCompletion: { _ in
            print("Finished")
        }, receiveValue: { data in
            print(data)
        })
      
        // Do any additional setup after loading the view.
    }

    
  

}

