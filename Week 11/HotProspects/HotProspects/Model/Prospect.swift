//
//  Prospect.swift
//  HotProspects
//
//  Created by Christopher Rios on 11/5/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    
    init() {
        self.people = []
    }
}
