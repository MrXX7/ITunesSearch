//
//  MovieListViewModel.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: FetchState = .good
    
    private let service = APIService()

    
        
        let limit: Int = 20
        var page: Int = 0
   
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for movie in results.results {
                        self?.movies.append(movie)
                    }
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched \(results.resultCount)")
                    
                case .failure(let error):
                    self?.state = .error("could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
