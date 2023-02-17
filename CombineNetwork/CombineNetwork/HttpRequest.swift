//
//  HttpRequest.swift
//  CombineNetwork
//
//  Created by Karamjit Singh on 11/02/23.
//

import Foundation
import Combine

class HttpRequest {
    
    func getPost() -> AnyPublisher<Data, URLError> {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url).map{ $0.data }.eraseToAnyPublisher()
    }
}


extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    
    func request( _ endpoint: Endpoint, then handler:@escaping Handler) -> URLSessionDataTask {
        
        let task = dataTask(with: endpoint.url, completionHandler: handler)
        task.resume()
        return task
    }
    
    
}
