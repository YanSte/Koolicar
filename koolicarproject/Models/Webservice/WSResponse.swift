//
//  WSResponse.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import Foundation

/**
 * Enumerateur pour les retours WS et code error
 */
enum WSResponse: Int, Error {
    
    case response200   = 200
    case response400   = 400
    case response401   = 401
    case response403   = 403
    case response500   = 500
    case unknown = 0
    case impossibleToParse = -1
    case noData = -2
    
    var description: String {
        switch self {
        case .unknown:           return "Successful? / Fail? Server error"
        case .response200:       return "Successful"
        case .response400:       return "Bad Request"
        case .response401:       return "Unauthorized"
        case .response403:       return "Forbidden"
        case .response500 :      return "Server Error"
        case .impossibleToParse: return "Fail to Parse"
        case .noData:            return "No storage"
        }
    }
}
