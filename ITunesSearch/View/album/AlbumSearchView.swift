//
//  AlbumSearchView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import SwiftUI

struct AlbumSearchView: View {
        @StateObject var viewModel = AlbumListViewModel()
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
                    .searchable(text: $viewModel.searchTerm)
                    .navigationTitle("Search Albums")
            }
        }
    }
struct SearchPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["ramstein", "cry to me", "maneskin"]
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending").font(.title)
            ForEach(suggestions, id:\.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text).font(.title2)
                }
            }
        }
    }
}
struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
