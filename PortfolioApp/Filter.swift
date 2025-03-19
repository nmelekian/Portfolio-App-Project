//
//  Filter.swift
//  PortfolioApp
//
//  Created by Nick Melekian on 3/19/25.
//

import Foundation

struct Filter: Identifiable, Hashable {
    var id: UUID
    var name: String
    var icon: String
    var minModificationDate = Date.distantPast
    var tag: Tag?
}
