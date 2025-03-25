//
//  InfoHealth.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 21/03/25.
//

import SwiftUI

struct InfoHealth: View {
    let bmi:Double
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                    if bmi < 16 {
                        BMIInfoView(
                            title: "Severe Thinness",
                            risks: [
                                "Increased risk of malnutrition and nutrient deficiencies",
                                "Weakened immune system",
                                "Higher risk of osteoporosis and fractures",
                                "Muscle loss and fatigue"
                            ],
                            tips: [
                                "Consult a healthcare provider to rule out underlying medical conditions",
                                "Eat calorie-dense and nutrient-rich foods (healthy fats, proteins, complex carbs)",
                                "Include strength training exercises to build muscle mass",
                                "Stay hydrated and monitor vitamin & mineral intake"
                            ],
                            color: .red
                        )
                    } else if bmi < 17 {
                        BMIInfoView(
                            title: "Moderate Thinness",
                            risks: [
                                "Higher likelihood of weakened immunity",
                                "Potential hormonal imbalances",
                                "Increased risk of bone density loss"
                            ],
                            tips: [
                                "Increase daily calorie intake with nutrient-dense meals",
                                "Prioritize protein intake for muscle maintenance",
                                "Include strength and resistance training",
                                "Get regular health checkups to monitor vitamin and mineral levels"
                            ],
                            color: .orange
                        )
                    } else if bmi < 18.5 {
                        BMIInfoView(
                            title: "Mild Thinness",
                            risks: [
                                "Slightly increased risk of nutrient deficiencies",
                                "May experience fatigue, low energy levels"
                            ],
                            tips: [
                                "Maintain a balanced diet with sufficient calories",
                                "Focus on consuming whole foods, including proteins and healthy fats",
                                "Engage in moderate exercise to build strength"
                            ],
                            color: .yellow
                        )
                    } else if bmi < 25 {
                        BMIInfoView(
                            title: "Normal",
                            risks: [
                                "Generally considered a healthy weight range"
                            ],
                            tips: [
                                "Maintain a balanced diet with a variety of whole foods",
                                "Engage in regular physical activity",
                                "Get routine health checkups to monitor overall well-being"
                            ],
                            color: .green
                        )
                    } else if bmi < 30 {
                        BMIInfoView(
                            title: "Overweight",
                            risks: [
                                "Increased risk of cardiovascular diseases, high blood pressure, and diabetes",
                                "Potential joint and mobility issues"
                            ],
                            tips: [
                                "Adopt a balanced diet with controlled portions",
                                "Increase physical activity",
                                "Monitor sugar and processed food intake",
                                "Consider stress management techniques like meditation"
                            ],
                            color: .orange
                        )
                    } else if bmi < 35 {
                        BMIInfoView(
                            title: "Obese Class I",
                            risks: [
                                "Elevated risk of heart disease, stroke, and type 2 diabetes",
                                "Increased likelihood of sleep apnea and joint problems"
                            ],
                            tips: [
                                "Prioritize a nutrient-dense, portion-controlled diet",
                                "Engage in regular exercise, focusing on both cardio and strength training",
                                "Seek guidance from a nutritionist or health professional if needed"
                            ],
                            color: .red
                        )
                    } else if bmi < 40 {
                        BMIInfoView(
                            title: "Obese Class II",
                            risks: [
                                "Higher risk of severe cardiovascular disease, diabetes, and mobility issues",
                                "Potential impact on mental health due to body weight-related stress"
                            ],
                            tips: [
                                "Work closely with a healthcare professional for a structured weight management plan",
                                "Make sustainable dietary changes with whole, unprocessed foods",
                                "Incorporate low-impact exercises like swimming or cycling to reduce joint strain"
                            ],
                            color: .red
                        )
                    } else {
                        BMIInfoView(
                            title: "Obese Class III",
                            risks: [
                                "Significantly increased risk of life-threatening diseases (heart disease, diabetes, stroke)",
                                "Higher likelihood of respiratory issues and mobility restrictions"
                            ],
                            tips: [
                                "Seek medical supervision for a weight management plan",
                                "Implement gradual lifestyle changes with sustainable diet and activity adjustments",
                                "Explore medical interventions (if necessary) with a healthcare provider"
                            ],
                            color: .red
                        )
                    }
                }
                
        }
    }
    
    
    struct BMIInfoView: View {
        var title: String
        var risks: [String]
        var tips: [String]
        var color: Color

        var body: some View {
            VStack(alignment: .leading, spacing: 5) {
               
                
                VStack(alignment:.leading){
                    Text("Health Risks:")
                        .font(.headline).foregroundStyle(Color("MainRed"))

                    ForEach(risks, id: \.self) { risk in
                        Text("- \(risk)").font(.body).foregroundStyle(Color("Dark")).padding(.bottom, 4)
                    }
                }.padding(.bottom, 16)
               
                

                Text("Health Tips:")
                    .font(.headline).foregroundStyle(Color("MainGreen"))
                  

                ForEach(tips, id: \.self) { tip in
                    Text("- \(tip)").font(.body).foregroundStyle(Color("Dark")).padding(.bottom, 4)
                }
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .background(Color("Light"))
            .cornerRadius(8)
        }
    }


#Preview {
    InfoHealth(bmi:10)
}
