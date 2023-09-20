//
//  SettingsView.swift
//  MultiplicationTable
//
//  Created by Christopher Rios on 9/19/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: Settings
    @ObservedObject var settingsToggle: SettingsToggle
    
    var body: some View {
        VStack {
            Form {
                Section(header:
                            Text("Tables up to...")
                    .font(.title)
                    .foregroundColor(.orange)) {
                        Stepper(value: $settings.tablesUpTo, in: 1...12) {
                            Text("\(settings.tablesUpTo)")
                        }
                    }
                Section(header:
                            Text("Number of questions")
                    .font(.title)
                    .foregroundColor(.purple)) {
                        Picker("Number of questions", selection: $settings.numberOfQuestionsIndex) {
                            ForEach(0..<settings.numberOfQuestions.count, id: \Int.self) { i in
                                Text(self.numberOfQuestionsText(for: i))
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .font(.largeTitle)
                    }
            }
            
            Button("Start") {
                self.settingsToggle.isSettingsDisplayed.toggle()
            }
            .font(.system(size: 64))
        }
        .navigationBarItems(
            leading: Spacer(),
            trailing: Spacer()
        )
    }
    
    func numberOfQuestionsText(for i: Int) -> String {
        let noq = self.settings.numberOfQuestions[i]
        return noq == .all ? "All (\(settings.maxNumberOfQuestions))" : noq.rawValue
    }
}
#Preview {
    SettingsView(settings: Settings(), settingsToggle: SettingsToggle())
}
