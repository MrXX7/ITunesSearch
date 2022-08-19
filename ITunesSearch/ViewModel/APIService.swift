//
//  APIService.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import Foundation

enum EntityType: String {
    case album
    case song
    case movie
}

class APIService {
    
    func fetchAlbums(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<AlbumResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, page: page, limit: limit)
        fetch(type: AlbumResult.self, url: url, completion: completion)
    }
    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
        } else if let data = data {
            
            do {
                let result = try JSONDecoder().decode(type, from: data)
                completion(Result.success(result))
            } catch {
                completion(Result.failure(.decoding(error as? DecodingError)))
            }
        }
    }.resume()
    
}
    func createURL(for searchTerm: String, type: EntityType = .album, page: Int, limit: Int) -> URL? {
        //    https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
        let baseURL = "https://itunes.apple.com/search"
        
        let offset = page * limit
        
        let queryItems = [URLQueryItem(name: "term", value: "searchTerm"),
                          URLQueryItem(name: "entity", value: type.rawValue),
                          URLQueryItem(name: "limit", value: String(limit)),
                          URLQueryItem(name: "offset", value: String(offset))]
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
