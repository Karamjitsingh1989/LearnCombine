//
//  Endpoints.swift
//  NetworkLayerCore
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation
import Combine

public protocol Endpoints {
    
    var baseUrl: String { get }
    var path: String { get }
    var parameter: [URLQueryItem] { get }
    var headers: HTTPHeaders { get }
    var methods: HTTPMethods { get }
    
    
    func getUrl() -> URL?
    
}



extension Endpoints {
    
    func getUrl() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseUrl
        components.path = path
        components.queryItems = parameter
        return components.url
    }
}



public enum HTTPMethods: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    
}


public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}
