//
//  ContentView.swift
//  distanceConverter
//
//  Created by Uche Ochuba on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit: String = "meters"
    @State private var outputUnit: String = "meters"
    @State private var amount: Double = 0.0
    @FocusState private var amountIsFocused: Bool
    
    let inputUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    let outputUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    private let ratios: [String : Double] = ["meters": 1.0,
                                             "kilometers": 1000.0,
                                             "feet": 0.3048,
                                             "yards": 0.9144,
                                             "miles": 1609.34]
    
    var outputValue: Double {
        let convertIn = (ratios[inputUnit] ?? 1.0) * (amount)
        return convertIn * (1.0 / (ratios[outputUnit] ?? 1.0))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Units") {
                    Picker ("Select input unit", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Picker ("Select output unit", selection: $outputUnit){
                        ForEach(outputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section ("Amount"){
                    TextField ("Amount", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section {
                    Text (outputValue, format: .number)
                }
            }
            .navigationTitle("Converter")
        }
    }
}

#Preview {
    ContentView()
}
