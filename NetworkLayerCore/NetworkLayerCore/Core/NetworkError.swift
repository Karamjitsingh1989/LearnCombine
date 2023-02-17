//
//  NetworkError.swift
//  NetworkLayerCore
//
//  Created by Karamjit Singh on 17/02/23.
//

import Foundation

public enum NetworkError: Error, Equatable {
    
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJson(_ error: String)
    case unauthorizated(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknownError(code: Int, error: String)
}
