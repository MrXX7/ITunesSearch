//
//  FetchState.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
