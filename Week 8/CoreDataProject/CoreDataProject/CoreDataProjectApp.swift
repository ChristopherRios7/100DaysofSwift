//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Christopher Rios on 10/11/23.
//

import SwiftUI
import CoreData

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            DynamicFilteringContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
