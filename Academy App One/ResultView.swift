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
    
    
    
    
    // Move these calculations to computed properties
    var bmiScore: Double {
        calculateBMI(gender: gender, age: age, weight: weight, height: height)
    }
    
    var bmiCategory: String {
        getBMICategory(bmi: bmiScore)
    }
    
    var body: some View {
        NavigationStack{
            
            ScrollView(.vertical, showsIndicators: false){
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
                      
                        
                        Text(bmiCategory)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                            .background(Color("Accent"))
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    }
                    .padding(.top,180)
                }
               
               
                VStack(spacing:20){
                   
                    
                    
                    Image("imageHero")
                        .resizable()
                        .frame( height: 200)
                        .scaledToFit()
                        .cornerRadius(12)
                    
                    
                    VStack{
                        Text("Info Kesehatan").frame(maxWidth: .infinity, alignment: .leading).font(.headline).padding(.bottom,8)
                        Text("BMI 31.23 masuk dalam kategori obesitas kelas 1, yang berisiko terhadap berbagai penyakit kronis. Dengan pola makan sehat dan aktivitas fisik teratur, berat badan dapat dikendalikan untuk mengurangi risiko kesehatan jangka panjang.").font(.body)
                    }
                    .padding()
                    .frame(alignment: .leading)
                    .background(Color("NeutralGray"))
                    .cornerRadius(12)
                    
                    Spacer(minLength: 10)
                    
                    NavigationLink("Re-calculate"){
                        ContentView() .navigationBarBackButtonHidden(true)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color("Accent"))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .font(.headline)
                    
                    Spacer()
                }
                .padding(.horizontal, 8)
                .foregroundStyle(Color("Dark"))
            }
            .navigationTitle("Result").navigationBarTitleDisplayMode(.inline)
            
        }
        
       
       
        
    }
}

#Preview {
    ResultView(gender: "male", age: 20, weight: 60, height:170)
}


func calculateBMI(gender: String, age: Int, weight: Double, height: Double) -> Double {
    // BMI formula: weight (kg) / (height (m))²
    // Note: height is expected to be in meters
    
    // Ensure height is greater than 0 to avoid division by zero
    guard height > 0 else {
        return 0.0
    }
    
    let heightM = height / 100.0
    // Calculate BMI
    let bmi = weight / (heightM * heightM)
    
    // Round to one decimal place
    return round(bmi * 10) / 10
}

// Function to categorize BMI
func getBMICategory(bmi: Double) -> String {
    switch bmi {
    case ..<16:
        return "Severe Thinness"
    case 16..<17:
        return "Moderate Thinness"
    case 17..<18.5:
        return "Mild Thinness"
    case 18.5..<25:
        return "Normal"
    case 25..<30:
        return "Overweight"
    case 30..<35:
        return "Obese Class I"
    case 35..<40:
        return "Obese Class II"
    default:
        return "Obese Class III"
    }
}


