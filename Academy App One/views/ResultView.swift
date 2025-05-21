//
//  ResultView.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 17/03/25.
//

import SwiftUI

struct ResultView: View {
    var gender: String
    @Binding var age: Int
    @Binding var weight: Double
    @Binding var height: Double
    @Binding var ageInput: String
    @Binding var weightInput: String
    @Binding var heightInput: String
    
    @State var showResult: Bool = true
    
    @State private var isActive: Bool = true
    @State private var dataInserted: Bool = false 
    
    @State private var optionChoose: Int = 0
    
    
    
    var historyBmi: [HistoryBMI] = []
    
    var bmiScore: Double {
        calculateBMI(gender: gender, age: age, weight: weight, height: height)
    }
    
    var bmiCategory: BMICategory {
        getBMICategory(bmi: bmiScore)
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.modelContext) var context
    
    var body: some View {
        
        
        NavigationStack{
            
            ScrollView(.vertical, showsIndicators: true){
                Spacer(minLength:40)
                
                ZStack{
                    
                    ChartBMI(bmi: bmiScore)
                    
                    
                    VStack(spacing:4){
                        VStack(alignment: .center){
                            Text("Your BMI Score :")
                            Text(String(format: "%.1f", bmiScore))
                                .font(.system(size: 64))
                                .fontWeight(.bold)
                        }
                        
                        
                        Text(bmiCategory.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                            .background(bmiCategory.color)
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    }
                    .padding(.top,180)
                }

                VStack(spacing:20){
                    
                    VStack {
                        Picker("", selection: $optionChoose) {
                            Text("Health info").tag(0)
                            Text("BMI info").tag(1)
                            
                        }
                        .pickerStyle(.segmented)
                        
                        if(optionChoose == 0){
                            InfoHealth(bmi: bmiScore)
                        }else{
                            InfoBMI(bmi: bmiScore)
                        }
                    }
                    .frame(alignment: .leading)
                    .background(Color("Light"))
                    .cornerRadius(12)
                    
                    WeightRecommendation(height:height)
                    
                    Spacer(minLength: 10)
                    
                    Button(action: {
                        age = 0
                        weight = 0.0
                        height = 0.0
                        ageInput = ""
                        weightInput = ""
                        heightInput = ""
                        dismiss()
                    }) {
                        HStack {
                            Text("RE-CALCULATE")
                                .font(.headline).fontWeight(.bold)
                            Image(systemName: "arrow.turn.down.left").imageScale(.large)
                        }
                    }.frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color("Accent"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .font(.headline)
                        .onAppear {
                            // If you want to insert data when the view appears, do it here
                            if isActive && !dataInserted {
                                saveBMI()
                                dataInserted = true
                            }
                            
                           
                        }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .foregroundStyle(Color("Dark"))
                
            }.background(Color("LightBg"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        
                        Text("Result")
                            .font(.custom("ArchivoBlack-Regular", size: 24)).foregroundStyle(Color("Dark"))
                        
                        
                        
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }.foregroundStyle(Color("Dark"))
                        }
                    }
                }.toolbarBackground(Color("Light"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
        
        
        
        
    }
    
    
    // Function to save BMI data
    func saveBMI() {
        let bmi = HistoryBMI(
            id: UUID().uuidString, // Better to use UUID for unique IDs
            bmiScore: bmiScore,
            category: bmiCategory.name,
            date: Date(),
            height: height,
            weight: weight,
            age: age,
            gender: gender
        )
        context.insert(bmi)
        
        do {
            try context.save()
            print("BMI data saved successfully")
        } catch {
            print("Failed to save BMI data: \(error)")
        }
    }
}

#Preview {
    ResultView(gender: "male", age: .constant(20), weight: .constant(80), height: .constant(170), ageInput: .constant(""), weightInput: .constant(""), heightInput: .constant(""))
}







