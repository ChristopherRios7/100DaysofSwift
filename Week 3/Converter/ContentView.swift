//
//  ContentView.swift
//  Converter
//
//  Created by Christopher Rios on 9/1/23.
//

import SwiftUI

struct ContentView: View {
    //Length Conversion
    @State private var input = 100.0
    @State private var selectedUnits = 0
    @State private var inputUnit:Dimension = UnitLength.meters
    @State private var outputUnit:Dimension = UnitLength.kilometers
    @FocusState private var isInputFocused: Bool
    
    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    
    let unitTypes = [
        [UnitLength.feet, UnitLength.kilometers, UnitLength.miles, UnitLength.yards],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
//    let units: [UnitLength] = [.feet, .kilometers, .miles, .yards]
    let formatter: MeasurementFormatter
    
    var result: String {
            let inputMeasurement = Measurement(value: input, unit: inputUnit)
            let outputMeasurement = inputMeasurement.converted(to: outputUnit)
            return formatter.string(from: outputMeasurement)
        }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isInputFocused)
                    
                } header: {
                    Text("Amount to convert")
                }
                Picker("Conversion", selection: $selectedUnits){
                    ForEach(0..<conversions.count){
                        Text(conversions[$0])
                    }
                }
                Picker("Convert from", selection: $inputUnit){
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Picker("Convert to", selection: $outputUnit){
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section{
                    Text(result)
                } header: {
                    Text("Result")
                }
                
            }.navigationTitle("Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done"){
                            isInputFocused = false
                        }
                    }
                }
                .onChange(of: selectedUnits) { newSelection in
                    let units = unitTypes[newSelection]
                    inputUnit = units[0]
                    outputUnit = units[1]
                }
        }
    }
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}

#Preview {
    ContentView()
}
