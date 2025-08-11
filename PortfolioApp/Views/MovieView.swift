//
//  MovieView.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 8/11/25.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var movie: Movie
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    TextField("Title", text: $movie.movieTitle, prompt: Text("Enter the Movie Title"))
                    
                    Text("**Watched** \(movie.MovieWatchedDate.formatted(date: .long, time: .shortened))")
                        .foregroundStyle(.secondary)
                    
                    Text("**Status:** \(movie.movieStatus)")
                        .foregroundStyle(.secondary)
                }
                
                Picker("Rating", selection: $movie.rating) {
                    Text("1").tag(Int16(1))
                    Text("2").tag(Int16(2))
                    Text("3").tag(Int16(3))
                    Text("4").tag(Int16(4))
                    Text("5").tag(Int16(5))
                }
                
                
                Menu {
                    ForEach(movie.movieTags) { tag in
                        Button {
                            movie.removeFromTags(tag)
                        } label: {
                            Label(tag.tagName, systemImage: "checkmark")
                        }
                    }
                    
                    let otherTags = dataController.missingTags(from: movie)
                    
                    if otherTags.isEmpty == false {
                        Divider()
                        
                        Section("Add Tags") {
                            ForEach(otherTags) { tag in
                                Button(tag.tagName) {
                                    movie.addToTags(tag)
                                }
                            }
                        }
                    }
                } label: {
                    Text(movie.movieTagsList)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .animation(nil, value: movie.movieTagsList)
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Basic Information")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    TextField("Description", text: $movie.movieContent, prompt: Text("Enter your review of the movie."), axis: .vertical)
                }
            }
        }
        .disabled(movie.isDeleted)
    }
}

#Preview {
    MovieView(movie: .example)
}
