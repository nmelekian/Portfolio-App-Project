//
//  Movie-CoreDataHelpers.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 6/4/25.
//

import Foundation

extension Movie {
    var movieTitle: String {
        get { title ?? "" }
        set { title = newValue }
    }
    
    var movieContent: String {
        get { content ?? "" }
        set { content = newValue}
    }
    
    var movieReleaseDate: Date {
        creationDate ?? .now
    }
    
    var MovieWatchedDate: Date {
        modificationDate ?? .now
    }
    
    var movieTags: [Tag] {
        let result = tags?.allObjects as? [Tag] ?? []
        return result.sorted()
    }
    static var example: Movie {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let movie = Movie(context: viewContext)
        movie.title = "Movie Time"
        movie.content = "This is the best movie ever"
        movie.watchPriority = 2
        movie.creationDate = .now
        
        return movie
    }
}

extension Movie: Comparable {
    public static func < (lhs: Movie, rhs: Movie) -> Bool {
        let left = lhs.movieTitle.localizedLowercase
        let right = rhs.movieTitle.localizedLowercase
        
        if left == right {
            return lhs.movieReleaseDate < rhs.movieReleaseDate
        } else {
            return left < right
        }
    }
    
    
}
