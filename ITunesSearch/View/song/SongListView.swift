//
//  SongListView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 20.08.2022.
//

import SwiftUI

struct SongListView: View {
        @ObservedObject var viewModel: SongListViewModel
        var body: some View {
            List{
                ForEach(viewModel.songs) { song in
                    Text(song.trackName)
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
        }
    }

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel())
    }
}
