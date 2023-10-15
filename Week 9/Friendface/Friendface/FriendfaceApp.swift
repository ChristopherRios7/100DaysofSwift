//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Christopher Rios on 10/14/23.
//

import SwiftUI
import CoreData

@main
struct FriendfaceApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
