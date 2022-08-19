//
//  APIError.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "urlSession error: \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "bad response with status code: \(statusCode)"
        case .decoding(let decodingError):
            return "decoding error: \(decodingError)"
        case .unknown:
            return "unknown"
        }
    }
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return "something wet wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ??
            "something wet wrong"
        case .badResponse(_):
            return "something wet wrong"
        case .decoding(let decodingError):
            return decodingError.localizedDescription
        }
    }
}
