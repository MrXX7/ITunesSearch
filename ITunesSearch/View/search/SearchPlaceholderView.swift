//
//  SearchPlaceholderView.swift
//  ITunesSearch
//
//  Created by Oncu Can on 20.08.2022.
//

import SwiftUI

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

struct SearchPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholderView(searchTerm: .constant("John"))
    }
}
