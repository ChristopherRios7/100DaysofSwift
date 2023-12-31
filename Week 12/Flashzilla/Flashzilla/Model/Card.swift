//
//  Card.swift
//  Flashzilla
//
//  Created by Christopher Rios on 11/10/23.
//

import Foundation

struct Card: Codable, Identifiable, Hashable{
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
