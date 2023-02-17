//
//  NetworkRequest.swift
//  NetworkLayerCore
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation
import Combine

class NetworkRequest: Requestable {
    
    
    var requestTimeOut: Float = 30
    
    
    func request<T>(_ request: RequestModel) -> AnyPublisher<T, NetworkError> where T : Codable {
        
        
        guard let requestURL = request.getUrlRequest() else {
            fatalError("Invalid URL")
           // return NetworkError.badURL("Invalid URL")
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = TimeInterval(request.requestTimeOut ?? requestTimeOut)
        
        return URLSession.shared.dataTaskPublisher(for: requestURL).tryMap({ output in
            guard  output.response is HTTPURLResponse else {
                throw NetworkError.serverError(code: 0, error: "Server error")
            }
            return output.data
        })
         .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return NetworkError.invalidJson(String(describing: error))
                
            }.eraseToAnyPublisher()
        
    }
    
}
