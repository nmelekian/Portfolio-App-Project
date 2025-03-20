//
//  SidebarView.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/18/25.
//

import SwiftUI

struct SidebarView: View {
    @Environment(DataController.self) private var dataController: DataController
    let smartFilters: [Filter] = [.all, .recent]
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.id ?? UUID(), name: tag.name ?? "No name", icon: "tag", tag: tag)
        }
    }
    
    var body: some View {
        @Bindable var dataController = dataController
        
        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            
            Section("Tags") {
                ForEach(tagFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
        }
        .toolbar {
            Button {
                dataController.deleteAll()
                dataController.createSampleData()
            } label: {
                Label("Add samples", systemImage: "flame")
            }
        }
    }
}

#Preview {
    SidebarView()
}
