//
//  UserView.swift
//  Friendface
//
//  Created by Christopher Rios on 10/14/23.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        List {
            Section {
                Text(user.about)
                    .padding(.vertical)
            } header: {
                Text("About")
            }
            
            Section {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            } header: {
                Text("Contact details")
            }
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserView(user: User.example)
}
