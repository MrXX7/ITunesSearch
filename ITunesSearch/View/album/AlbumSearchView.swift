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

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
