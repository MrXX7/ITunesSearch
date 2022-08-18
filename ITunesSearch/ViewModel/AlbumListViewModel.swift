//
//  AlbumListViewModel.swift
//  ITunesSearch
//
//  Created by Oncu Can on 18.08.2022.
//

import Foundation

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = "Jack Johnson"
    @Published var albums: [Album] = [Album]()
    
    func fetchAlbums(for searchTerm: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5") else {
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else if let data = data {
                do{
             let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    self.albums = result.results
                } catch {
                    print("decoding error: \(error.localizedDescription)")
                }
            }
        })
                                   }
                                   }
