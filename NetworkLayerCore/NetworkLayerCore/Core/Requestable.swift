//
//  Requestable.swift
//  NetworkLayerCore
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation
import Combine

public protocol Requestable {
    
    var requestTimeOut: Float{ get }
    
    func request<T: Codable>(_ request: RequestModel) -> AnyPublisher<T, NetworkError>
}
