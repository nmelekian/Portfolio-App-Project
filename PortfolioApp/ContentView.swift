//
//  ContentView.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    
    var movies: [Movie] {
        let filter = dataController.selectedFilter ?? .all
        var allMovies: [Movie]
        
        if let tag = filter.tag {
            allMovies = tag.movies?.allObjects as? [Movie] ?? []
        } else {
            let request = Movie.fetchRequest()
            request.predicate = NSPredicate(format: "modificationDate > %@", filter.minModificationDate as NSDate)
            allMovies = (try? dataController.container.viewContext.fetch(request)) ?? []
        }
        
        return allMovies.sorted()
    }
    
    var body: some View {
//        @Bindable var dataController = dataController
        
        List {
            ForEach(movies) { movie in
                MovieRow(movie: movie)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Movies")
    }
    
    func delete(_ offsets: IndexSet) {
        for offset in offsets {
            let item = movies[offset]
            dataController.delete(item)
        }
    }
}

#Preview {
    ContentView()
}
