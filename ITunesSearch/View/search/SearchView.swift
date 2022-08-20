//
//  SearchView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 20.08.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var selectedEntityType = EntityType.all
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Divider()
                
                switch selectedEntityType {
                case .all:
                    SearchAllListView(albumListViewModel: albumListViewModel, songListViewModel: songListViewModel, movieListViewModel: movieListViewModel)
                case .album:
                    AlbumListView(viewModel: albumListViewModel)
                case .song:
                    SongListViewModel()
                case .movie:
                    <#code#>
                }
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
