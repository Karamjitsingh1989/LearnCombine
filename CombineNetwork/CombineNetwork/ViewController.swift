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
        
       // let httpRequest = HttpRequest()
       /*
        var subscriber =   httpRequest.getPost().sink { _ in
            print("Finished")
        } receiveValue: { data in
            print(data)
        }
        
  */

        let subscriber = self.getPost().sink { _ in
            
        } receiveValue: { data in
            print(data)
        }


        // Do any additional setup after loading the view.
    }

    
    func getPost() -> AnyPublisher<Data, URLError> {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url).map{ $0.data }.eraseToAnyPublisher()
    }

}

