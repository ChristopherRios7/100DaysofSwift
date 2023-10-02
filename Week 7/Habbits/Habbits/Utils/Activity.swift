//
//  Activity.swift
//  Habbits
//
//  Created by Christopher Rios on 10/1/23.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example Activity", description: "This is an example activity")
}
