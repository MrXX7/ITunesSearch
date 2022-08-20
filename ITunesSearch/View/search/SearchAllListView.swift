//
//  SearchAllListView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 20.08.2022.
//

import SwiftUI

struct SearchAllListView: View {
    @ObservedObject private var albumListViewModel: AlbumListViewModel
    @ObservedObject private var songListViewModel: SongListViewModel
    @ObservedObject private var movieListViewModel: MovieListViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct SearchAllListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchAllListView()
//    }
//}
