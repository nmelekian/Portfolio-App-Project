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
                    
            } content: {
                ContentView()
                    
            } detail: {
                DetailView()
                    
            }
            .environmentObject(dataController)
            .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
