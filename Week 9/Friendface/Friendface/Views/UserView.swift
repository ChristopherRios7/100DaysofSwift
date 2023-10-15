//
//  UserView.swift
//  Friendface
//
//  Created by Christopher Rios on 10/14/23.
//

import SwiftUI

struct UserView: View {
    let user: CachedUser
    
    var body: some View {
        List {
            Section {
                Text(user.wrappedName)
                    .padding(.vertical)
            } header: {
                Text("About")
            }
            
            Section {
                Text("Address: \(user.wrappedAddress)")
                Text("Company: \(user.wrappedCompany)")
            } header: {
                Text("Contact details")
            }
            
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    UserView(user: User.example)
//}
