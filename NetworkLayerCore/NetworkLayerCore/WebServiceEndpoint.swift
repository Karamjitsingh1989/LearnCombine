//
//  WebServiceEndpoint.swift
//  NetworkLayerCore
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation

enum ServiceEndPoint: Endpoints {
   
    
    var baseUrl: String {
        
        switch self {
            
        case .newStories, .newsStoryID:
            return ""
            
        }
        
    }
    
    var path: String
    
    var parameter: [URLQueryItem]
    
    var headers: HTTPHeaders
    
    var methods: HTTPMethods
    
    
    case newStories
    case newsStoryID
    
    
    
    
    
}
