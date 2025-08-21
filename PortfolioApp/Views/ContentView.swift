//
//  ContentView.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    
    
    
    var body: some View {
        //        @Bindable var dataController = dataController
        
        List(selection: $dataController.selectedMovie) {
            ForEach(dataController.moviesForSelectedFilter()) { movie in
                MovieRow(movie: movie)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Movies")
        .searchable(text: $dataController.filterText, tokens: $dataController.filterTokens,
                    suggestedTokens: .constant(dataController.suggestedFilterTokens), prompt: "Filter movies, or type # to add tags") { tag in
            Text(tag.tagName)
        }
    }
    
    func delete(_ offsets: IndexSet) {
        let movies = dataController.moviesForSelectedFilter()
        
        for offset in offsets {
            let item = movies[offset]
            dataController.delete(item)
        }
    }
}

#Preview {
    ContentView()
}
