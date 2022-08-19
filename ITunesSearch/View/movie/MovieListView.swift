//
//  MovieListView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 19.08.2022.
//

import SwiftUI

struct MovieListView: View {
        @ObservedObject var viewModel: MovieListViewModel
        
        var body: some View {
            List{
                ForEach(viewModel.movies) { movie in
                    Text(movie.trackName)
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

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel())
    }
}
