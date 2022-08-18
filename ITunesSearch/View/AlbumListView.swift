//
//  AlbumListView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 18.08.2022.
//

import SwiftUI

struct AlbumListView: View {
    @StateObject var viewModel = AlbumListViewModel()
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.albums){ album in
                    Text(album.collectionName)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    Color.gray
                        .onAppear{
                            viewModel.loadMore()
                        }
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
