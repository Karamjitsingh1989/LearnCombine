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
