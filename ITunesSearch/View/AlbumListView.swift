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
                ForEach(viewModel.albums) { album in
                    Text(album.collectionName)
                }
                
                switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                    
                case .loadedAll:
//                    EmptyView()
                    Color.gray
                case .error(let message):
                    Text(message)
                        .foregroundColor(.pink)
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
