//
//  MovieListView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import SwiftUI

struct MovieSearchListView: View {
    @State private var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    MovieListView(viewModel: viewModel)
                }
            }
                    .searchable(text: $viewModel.searchTerm)
                    .navigationTitle("Search Movies")
            }
        }
    }

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchListView()
    }
}
