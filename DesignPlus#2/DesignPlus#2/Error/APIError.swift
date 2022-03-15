//
//  APIError.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/2/22.
//

import Foundation

// MARK: 3. Setting up error responses

enum APIError: Error {
    case DecodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .DecodingError:
            return "Failed to decode the object from the service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
