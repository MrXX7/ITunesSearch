//
//  Movie.swift
//  ITunesSearch
//
//  Created by Oncu Can on 18.08.2022.
//

import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let wrapperType, kind: String
    let artistID: Int?
    let trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription: String?
    let longDescription: String
    
    var id: Int {
        return trackID
    }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
    }
}
