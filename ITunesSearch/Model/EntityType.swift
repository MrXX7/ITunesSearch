//
//  EntityType.swift
//  ITunesSearch
//
//  Created by Oncu Can on 20.08.2022.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case all
    case album
    case song
    case movie
    
    var id: String {
        self.rawValue
    }
        func name() -> String {
            switch self {
            case .all:
                return "All"
            case .album:
                return "Albums"
            case .song:
                return "Songs"
            case .movie:
                return "Movies"
            }
        }
    }
