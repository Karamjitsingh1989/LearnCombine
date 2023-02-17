//
//  RequestModel.swift
//  NetworkLayerCore
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation

public struct RequestModel {
  
    
    let endPoints: Endpoints
    let body: Data?
    let requestTimeOut:Float?
    
    init(endPoints: Endpoints, body: Data? = nil, requestTimeOut: Float? = nil) {
        self.endPoints = endPoints
        self.body = body
        self.requestTimeOut = requestTimeOut
    }
    
  /*
    init(endPoints: Endpoints, body: Encodable? = nil, requestTimeOut: Float? = nil) {
        self.endPoints = endPoints
        self.body = body?.encode(to: Data.Type)
        self.requestTimeOut = requestTimeOut
    }
    */
    
    func getUrlRequest() -> URLRequest? {
        
        guard let url = endPoints.getUrl() else {
            print("URL NOT FOUND")
            return nil
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = endPoints.methods.rawValue
        
        for header in endPoints.headers {
            request.addValue(header.value, forHTTPHeaderField: header.name)
        }
        return request
    }
    
}
