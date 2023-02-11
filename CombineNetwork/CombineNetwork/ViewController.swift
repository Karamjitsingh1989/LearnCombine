//
//  ViewController.swift
//  CombineNetwork
//
//  Created by Karamjit Singh on 11/02/23.
//

import UIKit
import Combine
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subscriber =   HttpRequest().getPost().sink { _ in
            
        } receiveValue: { data in
            print(data)
        }
        
        


        // Do any additional setup after loading the view.
    }


}

