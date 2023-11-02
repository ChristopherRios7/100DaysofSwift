//
//  ContentView.swift
//  HotProspects
//
//  Created by Christopher Rios on 11/2/23.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject private var user = User()
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

#Preview {
    ContentView()
}
