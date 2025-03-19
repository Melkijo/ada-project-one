//
//  ContentView.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 17/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectionGender: String = "Male"
    @State private var ageInput: String = ""
    @State private var age: Int = 0
    @State private var heightInput: String = ""
    @State private var height: Double = 0.0
    @State private var weightInput: String = ""
    @State private var weight: Double = 0.0
    var body: some View {
        
        NavigationStack{
            Spacer()
            VStack(spacing:28){
                
                
                VStack {
                    Text("Gender")
                        .font(.headline)
                        .foregroundStyle(Color("Dark"))
                    
                    
                    HStack(spacing: 16) {
                        // Male option
                        GenderOptionView(
                            emoji: "🤷‍♂️",
                            label: "Male",
                            isSelected: selectionGender == "Male",
                            color: .blue
                        )
                        .onTapGesture {
                            selectionGender = "Male"
                        }
                        
                        // Female option
                        GenderOptionView(
                            emoji: "🙍‍♀️",
                            label: "Female",
                            isSelected: selectionGender == "Female",
                            color: .pink
                        )
                        .onTapGesture {
                            selectionGender = "Female"
                        }
                    }
                    
                    
                    
                    
                    
                }
                
                
                
                VStack(alignment: .leading){
                    Text("Age")
                        .font(.headline)
                    
                    
                    HStack{
                        TextField("Enter your age", text: $ageInput)
                            .keyboardType(.numberPad) // Better for age (integers only)
                            .padding()
                            .multilineTextAlignment(.center)
                        //                            .onChange(of: ageInput) { oldValue, newValue in
                        //                                // Filter out non-numeric characters
                        //                                let filtered = newValue.filter { $0.isNumber }
                        //
                        //                                // Update the text field if needed
                        //                                if filtered != newValue {
                        //                                    ageInput = filtered
                        //                                }
                        //
                        //                                // Convert to Int
                        //                                age = Int(filtered) ?? 0
                        //                            }
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                        
                        Text("Years")
                        
                        
                    }
                    
                    
                }
                .padding(20)
                .background(Color("NeutralGray"))
                .cornerRadius(20)
                
                HStack(spacing:16){
                    VStack(alignment:.leading){
                        Text("Height")
                            .font(.headline)
                        HStack{
                            TextField("00.00", text: $heightInput)
                                .keyboardType(.decimalPad)
                                .padding()
                            
                                .onChange(of: heightInput) { oldValue, newValue in
                                    // Filter out non-numeric characters
                                    let filtered = newValue.filter { $0.isNumber || $0 == "." }
                                    
                                    // Ensure only one decimal point
                                    if filtered.filter({ $0 == "." }).count > 1,
                                       let lastIndex = filtered.lastIndex(of: ".") {
                                        var newFiltered = filtered
                                        newFiltered.remove(at: lastIndex)
                                        heightInput = newFiltered
                                    } else {
                                        heightInput = filtered
                                    }
                                    
                                    // Convert to Double
                                    height = Double(filtered) ?? 0.0
                                }
                                .overlay(VStack{Divider().offset(x: 0, y: 15)})
                            Text("CM")
                        }
                        
                    }
                    .padding( 20)
                    .background(Color("NeutralGray"))
                    .cornerRadius(12)
                    
                    VStack(alignment:.leading){
                        Text("Weight")
                            .font(.headline)
                        HStack{
                            TextField("00.00", text: $weightInput)
                                .keyboardType(.decimalPad)
                                .padding()
                                .onChange(of: weightInput) { oldValue, newValue in
                                    // Filter out non-numeric characters
                                    let filtered = newValue.filter { $0.isNumber || $0 == "." }
                                    
                                    // Ensure only one decimal point
                                    if filtered.filter({ $0 == "." }).count > 1,
                                       let lastIndex = filtered.lastIndex(of: ".") {
                                        var newFiltered = filtered
                                        newFiltered.remove(at: lastIndex)
                                        weightInput = newFiltered
                                    } else {
                                        weightInput = filtered
                                    }
                                    
                                    // Convert to Double
                                    weight = Double(filtered) ?? 0.0
                                }
                                .overlay(VStack{Divider().offset(x: 0, y: 15)})
                            
                            Text("KG")
                        }
                        
                    }
                    .padding( 20)
                    .background(Color("NeutralGray"))
                    .cornerRadius(12)
                }
                
                
                
                
            }.navigationTitle("BMI Calculator").navigationBarTitleDisplayMode(.inline)
            
            
            Spacer()
            NavigationLink("Calculate"){
                ResultView(gender: selectionGender,age: age, weight: weight, height: height).navigationBarBackButtonHidden(true)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color("Accent"))
            .foregroundColor(.black)
            .cornerRadius(12)
            .font(.headline)
            
            
            
            
            
            
            
            
            
            
            
            
        }
        .padding(.horizontal, 8)
        .foregroundStyle(Color("Dark"))
    }
}

#Preview {
    ContentView()
}


struct GenderOptionView: View {
    let emoji: String
    let label: String
    let isSelected: Bool
    let color: Color
    
    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 40))
            Text(label)
                .foregroundColor(isSelected ? .black : .primary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(isSelected ? Color("Accent") : Color("NeutralGray"))
        )
        //        .overlay(
        //            RoundedRectangle(cornerRadius: 12)
        //                .stroke(isSelected ? color : Color.clear, lineWidth: 3)
        //        )
    }
}
