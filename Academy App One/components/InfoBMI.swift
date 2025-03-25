//
//  InfoBMI.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 21/03/25.
//

import SwiftUI

struct InfoBMI: View {
    let bmi: Double
    var body: some View {
        VStack(spacing: 4) {
                    infoBmiView(
                        bmi: bmi,
                        category: "Severe Thinness",
                        bmiRange: "<16",
                        bmiRangeFloor: Double.leastNonzeroMagnitude,
                        bmiRangeCeil: 16,
                        categoryColor: Color("MainBlue")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Moderate Thinness",
                        bmiRange: "16 - 16.9",
                        bmiRangeFloor: 16,
                        bmiRangeCeil: 17,
                        categoryColor: Color("MainBlue1")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Mild Thinness",
                        bmiRange: "17 - 18.4",
                        bmiRangeFloor: 17,
                        bmiRangeCeil: 18.5,
                        categoryColor: Color("MainBlue2")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Normal",
                        bmiRange: "18.5 - 24.9",
                        bmiRangeFloor: 18.5,
                        bmiRangeCeil: 25,
                        categoryColor: Color("MainGreen")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Overweight",
                        bmiRange: "25 - 29.9",
                        bmiRangeFloor: 25,
                        bmiRangeCeil: 30,
                        categoryColor: Color("MainYellow")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Obese Class I",
                        bmiRange: "30 - 34.9",
                        bmiRangeFloor: 30,
                        bmiRangeCeil: 35,
                        categoryColor: Color("MainRed")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Obese Class II",
                        bmiRange: "35 - 39.9",
                        bmiRangeFloor: 35,
                        bmiRangeCeil: 40,
                        categoryColor: Color("MainRed1")
                    )
                    
                    infoBmiView(
                        bmi: bmi,
                        category: "Obese Class III",
                        bmiRange: "≥40",
                        bmiRangeFloor: 40,
                        bmiRangeCeil: Double.greatestFiniteMagnitude,
                        categoryColor: Color("MainRed2")
                    )
                }
                .background(Color("Light"))
    }
    
   
}

#Preview {
    InfoBMI(bmi: 16.5)
}


struct infoBmiView: View {
    let bmi: Double
    let category: String
    let bmiRange: String
    let bmiRangeFloor: Double
    let bmiRangeCeil: Double
    let categoryColor: Color
    var body: some View {
        HStack {
            HStack {
                Circle().fill(categoryColor).frame(width: 15, height: 15)
                Text("\(category)").foregroundStyle(bmi >= bmiRangeFloor && bmi < bmiRangeCeil ? Color(.black) : Color("Dark"))
            }
            Spacer()
            Text("\(bmiRange)").foregroundStyle(bmi >= bmiRangeFloor && bmi < bmiRangeCeil ? Color(.black) : Color("Dark"))
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        .background(bmi >= bmiRangeFloor && bmi < bmiRangeCeil ? Color("BodyText") : Color.clear)
        .cornerRadius(8)
    }
}
