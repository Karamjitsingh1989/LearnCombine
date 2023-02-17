//
//  Endpoint.swift
//  CombineNetwork
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation


struct Endpoint {
    
    var path: String
    var queryItems: [URLQueryItem] = []
    var scheme: String = "https"
    var host: String
    
    init(path: String, host: String = "hacker-news.firebaseio.com") {
        self.path = path
        self.host = host
    }
    
}


extension Endpoint {
    
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL Components:\(components)")
        }
        return url
    }
}


extension Endpoint {
    
    static var topStories:Self {
        Endpoint(path: "v0/topstories.json")
    }
}







//enum Endpoint {
//    
//    case topStories
//   // case stories(id: Int)
//   // case search(query:String, maxResultCount:Int)
//}
//
//
//extension Endpoint {
//    
//    var url: URL {
//        switch self {
//        case .topStories:
//            return .makeForEndpoint("v0/topstories.json?print=pretty")
//            break
//      //  case .stories(id: let id):
//            
//    //    case .search(query: let query, maxResultCount: let maxResultCount):
//            
//        }
//    }
//}



//extension URL {
//
//    static var topStories: URL? {
//        makeForEndpoint("v0/topstories.json?print=pretty")
//    }
//    
//}


//private extension URL {
//    
//    static func makeForEndpoint(_ endpoint: String) -> URL {
//        URL(string: "https://hacker-news.firebaseio.com/\(endpoint)")!
//    }
//    
//}
//*/

