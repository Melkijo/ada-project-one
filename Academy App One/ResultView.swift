//
//  ResultView.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 17/03/25.
//

import SwiftUI

struct ResultView: View {
    let gender: String
    let age: Int
    let weight: Double
    let height: Double
    
    @State var showResult: Bool = true
    
    @State private var isActive: Bool = true
    @State private var dataInserted: Bool = false // Track if we've inserted data
    
    @State private var optionChoose: Int = 0
    
    var historyBmi: [HistoryBMI] = []
    
    var bmiScore: Double {
        calculateBMI(gender: gender, age: age, weight: weight, height: height)
    }
    
    var bmiCategory: BMICategory {
        getBMICategory(bmi: bmiScore)
    }
    
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
                
                HStack(alignment: .center, spacing: 10){
                    VStack{
//                        Text("Age :").font(.caption)
                        Text("\(age) Years old").font(.body).fontWeight(.light)
                        
                    }
                    Text(" | ")
                    VStack{
//                        Text("Gender :").font(.caption)
                        Text("\(gender)").font(.body).fontWeight(.light)

                        
                        
                    }
                    Text(" | ")
                    VStack{
//                        Text("Weight ").font(.caption)
                        Text(String(format: "%.1f kg", weight)).font(.body).fontWeight(.light)

                        
                    }
                    Text(" | ")
                    VStack{
//                        Text("Height :").font(.caption)
                        Text(String(format: "%.f cm", height)).font(.body).fontWeight(.light)

                        
                    }
                    
                }.padding(.top,8)
                    .padding(.bottom,32)
                
                
                VStack(spacing:20){
                    
                    
                    
//                    Image("imageHero")
//                        .resizable()
//                        .frame( height: 200)
//                        .scaledToFit()
//                        .cornerRadius(12)
                    
                    
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
                    .background(Color("NeutralGray"))
                    .cornerRadius(12)
                    
                    WeightRecommendation(height:height)
                    
                    Spacer(minLength: 10)
                    
                    
                    NavigationLink(destination: ContentView() .navigationBarBackButtonHidden(true)){
                        
                        HStack {
                            Text("RE-CALCULATE")
                                .font(.headline).fontWeight(.bold)
                            Image(systemName: "arrow.turn.down.left").imageScale(.large)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                    }
                    .frame(maxWidth: .infinity)
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
                .padding(.horizontal, 8)
                .foregroundStyle(Color("Dark"))
            }.background(Color("LightBg"))
           .navigationBarTitleDisplayMode(.inline)
           .toolbar {
               
               ToolbarItem(placement: .principal) {
                   
                   Text("Result")
                       .font(.custom("ArchivoBlack-Regular", size: 24)).foregroundStyle(Color("Dark"))
                       .frame(maxWidth: .infinity, alignment: .center)
                   
                   
                   
               }
           }.toolbarBackground(.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar) 
        }
        
        
        
        
    }
    
    
    // Function to save BMI data
    func saveBMI() {
        let bmi = HistoryBMI(
            id: UUID().uuidString, // Better to use UUID for unique IDs
            bmiScore: bmiScore,
            category: bmiCategory.name,
            date: Date()
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
    ResultView(gender: "male", age: 20, weight: 80, height:170)
}







