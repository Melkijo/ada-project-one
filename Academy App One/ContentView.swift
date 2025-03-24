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
            ScrollView{
                VStack(spacing:28){
                    
                    Spacer()
                    
                    VStack{
                        VStack(alignment:.leading, spacing:12) {
                            Text("Gender")
                                .font(.title3)
                                .foregroundStyle(Color("Dark"))
                                .fontWeight(.bold)
                            
                            
                            HStack(spacing: 8) {
                                // Male option
                                GenderOptionView(
                                    genderImage: "male",
                                    label: "Malessssss",
                                    isSelected: selectionGender == "Male",
                                    color: .blue
                                )
                                .onTapGesture {
                                    selectionGender = "Male"
                                }
                                
                                // Female option
                                GenderOptionView(
                                    genderImage: "female",
                                    label: "Females",
                                    isSelected: selectionGender == "Female",
                                    color: .pink
                                )
                                .onTapGesture {
                                    selectionGender = "Female"
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing:12){
                            Text("Age")
                                .font(.title3)
                                .foregroundStyle(Color("Dark"))
                                .fontWeight(.bold)
                            
                            
                            HStack{
                                TextField("Enter your age", text: $ageInput)
                                    .keyboardType(.numberPad) // Better for age (integers only)
                                    .multilineTextAlignment(.leading)
                                    .onChange(of: ageInput) { oldValue, newValue in
                                        // Filter out non-numeric characters
                                        let filtered = newValue.filter { $0.isNumber }
                                        
                                        // Update the text field if needed
                                        if filtered != newValue {
                                            ageInput = filtered
                                        }
                                        
                                        // Convert to Int
                                        age = Int(filtered) ?? 0
                                    }
                                    .overlay(VStack{Divider().offset(x: 0, y: 15)})
                                    .font(.title).fontWeight(.bold)
                                
                                Text("Years").font(.title3).fontWeight(.semibold)
                                
                                
                            } .padding(EdgeInsets(top: 52, leading: 32, bottom: 52, trailing: 32))
                                .background(Color("Light"))
                                .cornerRadius(20)
                            
                            
                        }
                        
                        
                        HStack(spacing:8){
                            VStack(alignment:.leading, spacing:12){
                                Text("Height")
                                    .font(.title3)
                                    .foregroundStyle(Color("Dark"))
                                    .fontWeight(.bold)
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
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text("cm").font(.title2).fontWeight(.medium)
                                }.padding(EdgeInsets(top: 32, leading: 20, bottom: 32, trailing: 20))
                                    .background(Color("Light"))
                                    .cornerRadius(12)
                                
                            }
                            
                            
                            VStack(alignment:.leading,spacing:12){
                                Text("Weight")
                                    .font(.title3)
                                    .foregroundStyle(Color("Dark"))
                                    .fontWeight(.bold)
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
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text("kg").font(.title2).fontWeight(.medium)
                                } .padding(EdgeInsets(top: 32, leading: 20, bottom: 32, trailing: 20))
                                    .background(Color("Light"))
                                    .cornerRadius(12)
                                
                            }
                            
                        }
                    }.onTapGesture {
                        hideKeyboard()
                    }
                   
                    
                    
                    Spacer()
                    NavigationLink(destination: ResultView(gender: selectionGender, age: age, weight: weight, height: height).navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("CALCULATE")
                                .font(.headline).fontWeight(.bold)
                            Image(systemName: "arrow.2.squarepath").imageScale(.large) //
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(isFormValid() ? Color("Accent") : Color.gray.opacity(0.5))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .disabled(!isFormValid())
                    
                    Spacer()
                    
                    
                    
                    
                }.padding(.horizontal,8)
                
            }.background(Color("LightBg"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .topBarLeading) {
                        
                        Text("CoBMI")
                            .font(.custom("ArchivoBlack-Regular", size: 20)).foregroundStyle(Color("Dark"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink{
                            HistoryView()
                            
                        }label:{
//                                                    Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90").padding(8)
//                                                        .background(Color("MainGreen"))
//                                                        .cornerRadius(6)
//                                                        
                            Text("History").font(.body).fontWeight(.medium).underline(true, color: Color("Dark"))
                        }
                    }
                }.toolbarBackground(.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                
            
        }.foregroundStyle(Color("Dark"))
        
        
        
    }
    
    private func isFormValid() -> Bool {
        let ageConverted = Int(ageInput) ?? 0
        let heightConverted = Int(heightInput) ?? 0
        let weightConverted = Int(weightInput) ?? 0
        let isAgeValid = ageConverted >= 2 && ageConverted <= 120
        let isHeightValid = heightConverted >= 50 && heightConverted <= 250 // assuming height in cm
        let isWeightValid = weightConverted >= 3 && weightConverted <= 500 // assuming weight in kg
        
        return isAgeValid && isHeightValid && isWeightValid
    }
    
}

#Preview {
    ContentView()
}


struct GenderOptionView: View {
    let genderImage: String
    let label: String
    let isSelected: Bool
    let color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(genderImage).resizable().scaledToFill().frame(width: 50, height: 50)
            
            Text(label)
                .foregroundColor(isSelected ? .black : .primary).fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(isSelected ? Color("Accent") : Color("Light"))
        )
    }
}
