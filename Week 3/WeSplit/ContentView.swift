//
//  ContentView.swift
//  WeSplit
//
//  Created by Christopher Rios on 8/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let localCurrency:FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var totalPerPerson: Double {
        //Calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var totalPlusTip: Double {
        //Calculate the total plus tip
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("What is the check amount? ")
                }
                    Section {
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(0..<101, id: \.self){
                                Text($0, format: .percent)
                            }
                        }
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                Section{
                    Text(totalPlusTip, format: localCurrency)
                }header: {
                    Text("Grand Total")
                }
                Section {
                    Text(totalPerPerson, format: localCurrency)
                }header: {
                    Text("Amount Per Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
