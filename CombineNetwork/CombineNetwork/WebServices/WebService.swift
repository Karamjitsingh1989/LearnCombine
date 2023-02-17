//
//  WebService.swift
//  CombineNetwork
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation
import Combine

class WebService {
    
    func getAllTopStories()-> AnyPublisher<[Int], Error> {
        
        let endpoint = Endpoint.topStories
        
//        guard  let url =  endpoint.url  else {
//           fatalError("Bad Request")
//        }
        
        return URLSession.shared.dataTaskPublisher(for: endpoint.url).tryMap(\.data).decode(type: [Int].self, decoder: JSONDecoder()).eraseToAnyPublisher()
        
    }
    
    
    func getAllTopStorieUsingHttpRequest()  {
        
        let url = Endpoint.topStories
        
        URLSession.shared.request(url) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            let stories = try? JSONDecoder().decode([Int].self, from: data)
            
            print(stories)
        }
        
    }
    
    
    
    
    
}
