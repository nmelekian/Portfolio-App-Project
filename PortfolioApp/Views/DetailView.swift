//
//  DetailView.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/18/25.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        VStack {
            if let movie = dataController.selectedMovie {
                MovieView(movie: movie)
            } else {
                NoMovieView()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView()
}
