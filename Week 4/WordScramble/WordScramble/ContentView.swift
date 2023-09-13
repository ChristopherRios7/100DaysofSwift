//
//  ContentView.swift
//  WordScramble
//
//  Created by Christopher Rios on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let people = ["Finn", "Leia", "Luke", "Rey"]
        
        List {
            Text("Static Row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static Row")
        }
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
