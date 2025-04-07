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
    
    @State private var isHeightEdited = false
    @State private var isWeightEdited = false
    @State private var isAgeEdited = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:20){
                    
                    Spacer()
                    
                    VStack(spacing:28){
                        VStack(alignment:.leading, spacing:12) {
                            Text("Gender")
                                .font(.title3)
                                .foregroundStyle(Color("Dark"))
                                .fontWeight(.bold)
                            
                            
                            HStack(spacing: 8) {
                                // Male option
                                GenderOptionView(
                                    genderImage: "male",
                                    label: "Male",
                                    isSelected: selectionGender == "Male",
                                    color: .blue
                                )
                                .onTapGesture {
                                    selectionGender = "Male"
                                }
                                
                                // Female option
                                GenderOptionView(
                                    genderImage: "female",
                                    label: "Female",
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
                            VStack(alignment: .leading, spacing:20){
                                HStack{
                                    TextField("Enter your age", text: $ageInput)
                                        .keyboardType(.numberPad) // Better for age (integers only)
                                        .multilineTextAlignment(.leading)
                                        .onChange(of: ageInput) { oldValue, newValue in
                                            
                                            isAgeEdited = true
                                            // Filter out non-numeric characters
                                            if newValue.count > 3 {
                                                ageInput = String(newValue.prefix(3))
                                            }
                                            age = Int(newValue) ?? 0
                                            
                                        }
                                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                                        .font(.title).fontWeight(.bold)
                                        .accentColor(Color("Dark"))
                                    
                                    Text("Years").font(.title3).fontWeight(.semibold)
                                    
                                    
                                }
                                
                                if isAgeEdited && (age < 2 || age > 120) {
                                    Text("*age should be between 2 and 120")
                                        .font(.caption2)
                                        .foregroundStyle(Color.red)
                                }else{
                                    Text("*age should be between 2 and 120")
                                        .font(.caption2)
                                        .foregroundStyle(Color("Light"))
                                }
                                
//                                Text("*age should be between 2 and 120")
//                                    .font(.caption)
//                                    .foregroundStyle(age < 2 || age > 120 ? Color.red : Color("Light"))
                                
                            }.padding(EdgeInsets(top: 40, leading: 32, bottom: 20, trailing: 32))
                                .background(Color("Light"))
                                .cornerRadius(20)
                        }
                        
                        
                        HStack(spacing:8){
                            VStack(alignment:.leading, spacing:12){
                                Text("Height")
                                    .font(.title3)
                                    .foregroundStyle(Color("Dark"))
                                    .fontWeight(.bold)
                                
                                VStack{
                                    HStack{
                                        TextField("00.00", text: $heightInput)
                                            .keyboardType(.decimalPad)
                                            .padding()
                                        
                                            .onChange(of: heightInput) { oldValue, newValue in
                                                               
                                                                isHeightEdited = true
                                                                
                                                                if newValue.count > 3 {
                                                                    heightInput = String(newValue.prefix(3))
                                                                }
                                                                height = Double(newValue) ?? 0
                                                            }
                                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .accentColor(Color("Dark"))
                                        
                                        Text("cm").font(.title2).fontWeight(.medium)
                                    }
                                    // Conditionally show error text
                                           if isHeightEdited && (height < 50 || height > 300) {
                                               Text("*height should be between 50cm to 300cm")
                                                   .font(.caption2)
                                                   .foregroundStyle(Color.red)
                                           }else{
                                               Text("*height should be between 50cm to 300cm")
                                                   .font(.caption2)
                                                   .foregroundStyle(Color("Light"))
                                           }
                                    
                                }.padding(EdgeInsets(top: 32, leading: 20, bottom: 12, trailing: 20))
                                    .background(Color("Light"))
                                    .cornerRadius(12)
                                
                                
                            }
                            
                            
                            VStack(alignment:.leading,spacing:12){
                                Text("Weight")
                                    .font(.title3)
                                    .foregroundStyle(Color("Dark"))
                                    .fontWeight(.bold)
                                
                                VStack{
                                    HStack{
                                        TextField("00.00", text: $weightInput)
                                            .keyboardType(.decimalPad)
                                            .padding()
                                            .onChange(of: weightInput) { oldValue, newValue in
                                                
                                                isWeightEdited = true
                                                if newValue.count > 3 {
                                                    weightInput = String(newValue.prefix(3))
                                                }
                                                weight = Double(newValue) ?? 0
                                            }
                                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .accentColor(Color("Dark"))
                                        
                                        Text("kg").font(.title2).fontWeight(.medium)
                                    }
                                    
                                    if isWeightEdited && (weight < 5 || weight > 500) {
                                        Text("*weight should be between 5kg to 500kg")
                                            .font(.caption2)
                                            .foregroundStyle(Color.red)
                                    }else{
                                        Text("*weight should be between 5kg to 500kg")
                                            .font(.caption2)
                                            .foregroundStyle(Color("Light"))
                                    }
                                  
                                    
                                }.padding(EdgeInsets(top: 32, leading: 20, bottom: 12, trailing: 20))
                                    .background(Color("Light"))
                                    .cornerRadius(12)
                                
                                
                            }
                            
                        }
                    }.onTapGesture {
                        hideKeyboard()
                    }
                   
                    
                    
                    Spacer()
                    NavigationLink(destination: ResultView(gender: selectionGender, age: $age, weight: $weight, height: $height, ageInput: $ageInput, weightInput: $weightInput, heightInput: $heightInput).navigationBarBackButtonHidden(true)) {
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
                    
                    
                    
                    
                }.padding(.horizontal,16)
                
            }.background(Color("LightBg"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        
                        Text("BoMI")
                            .font(.custom("ArchivoBlack-Regular", size: 24)).foregroundStyle(Color("Dark"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                        
                    }
//                    ToolbarItem(placement: .topBarTrailing){
//                        NavigationLink{
//                            HistoryView()
//                            
//                        }label:{
//                                                    Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90").padding(8)
//                                                        .background(Color("MainGreen"))
//                                                        .cornerRadius(6)
//                                                        
//                            Text("History").font(.body).fontWeight(.medium).underline(true, color: Color("Dark"))
//                        }
//                    }
                }.toolbarBackground(Color("Light"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                
            
        }.foregroundStyle(Color("Dark"))
        
        
        
    }
    
    private func isFormValid() -> Bool {
        let ageConverted = age
        let heightConverted = height
        let weightConverted = weight
        let isAgeValid = ageConverted >= 2 && ageConverted <= 120
        let isHeightValid = heightConverted >= 50 && heightConverted <= 300 // assuming height in cm
        let isWeightValid = weightConverted >= 5 && weightConverted <= 500 // assuming weight in kg
        
        
        
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
