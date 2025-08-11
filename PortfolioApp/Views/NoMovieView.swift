//
//  NoMovieView.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 8/11/25.
//

import SwiftUI

struct NoMovieView: View {
    @EnvironmentObject var dataController: DataController
    var body: some View {
        Text("No Movie Selected")
            .font(.title)
            .foregroundStyle(.secondary)
        
        Button("New Movie") {
            // make a new movie
        }
    }
}

#Preview {
    NoMovieView()
}
