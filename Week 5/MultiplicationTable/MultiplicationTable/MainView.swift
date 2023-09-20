//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by Christopher Rios on 9/19/23.
//

import SwiftUI

class SettingsToggle: ObservableObject {
    @Published var isSettingsDisplayed = true
}

struct MainView: View {
    @ObservedObject var settings = Settings()
    @ObservedObject var settingsToggle = SettingsToggle()
    
    var body: some View {
        NavigationView {
            Group {
                if settingsToggle.isSettingsDisplayed {
                    SettingsView(settings: settings, settingsToggle: settingsToggle)
                }
                else {
                    GameView(settings: settings, settingsToggle: settingsToggle)
                }
            }
            .navigationBarTitle("Multiplication")
        }
    }
}


#Preview {
    MainView().colorScheme(.dark)
}
