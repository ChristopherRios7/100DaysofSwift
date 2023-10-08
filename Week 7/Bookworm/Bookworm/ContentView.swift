//
//  ContentView.swift
//  Bookworm
//
//  Created by Christopher Rios on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Text("Hello, World!")
        
    }
}

#Preview {
    ContentView()
}
