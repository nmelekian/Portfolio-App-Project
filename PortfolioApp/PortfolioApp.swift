//
//  PortfolioAppApp.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/11/25.
//

import SwiftUI

@main
struct PortfolioApp: App {
    @Environment(\.scenePhase) var scenePhase
    
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
            .onChange(of: scenePhase) { _, phase in
                if phase != .active {
                    dataController.save()
                }
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
