//
//  PortfolioAppApp.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/11/25.
//

import SwiftUI

@main
struct PortfolioApp: App {
    @State var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
                    .environment(DataController.preview)
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
