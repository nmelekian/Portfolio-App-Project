//
//  MovieRow.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 6/4/25.
//

import SwiftUI

struct MovieRow: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var movie: Movie
    
    
    var body: some View {
        NavigationLink(value: movie) {
            HStack {
                Image(systemName: "movieclapper")
                    .imageScale(.large)
                    .opacity(movie.watchPriority == 2 ? 1 : 0)
                
                VStack(alignment: .leading) {
                    Text(movie.movieTitle)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text("No tags")
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                
                Spacer()
                
                
                VStack(alignment: .trailing) {
                    Text(movie.movieReleaseDate.formatted(date: .numeric, time: .omitted))
                        .font(.subheadline)
                    
                    if movie.watched {
                        Text("WATCHED")
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    MovieRow(movie: .example)
}
