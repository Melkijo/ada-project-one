//
//  ChartBMI.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 19/03/25.
//

import SwiftUI
import Charts

struct Score: Identifiable {
    let id = UUID()
    let type: String
    let value: Double
    let color: Color
}

struct ChartBMI: View {
    let bmi: Double
    
    @State private var scores: [Score] = [
        .init(type: "Severe Thinness", value: 5, color: .red),       // <16.0
        .init(type: "Moderate Thinness", value: 2, color: .orange),  // 16.0-17.0
        .init(type: "Mild Thinness", value: 3, color: .yellow),      // 17.0-18.5
        .init(type: "Normal", value: 13, color: .green),              // 18.5-25.0
        .init(type: "Overweight", value: 10, color: .yellow),         // 25.0-30.0
        .init(type: "Obese Class I", value: 10, color: .orange),      // 30.0-35.0
        .init(type: "Obese Class II", value: 10, color: .red),        // 35.0-40.0
        .init(type: "Obese Class III", value: 10, color: .purple),     // >40.0
        .init(type: "", value: 63, color: Color("Background"))
    ]
    
        private var arrowAngle: Double {
      
            let minBMI: Double = 15
            let maxBMI: Double = 39
            let minAngle: Double = 0
            let maxAngle: Double = 180.0
            
            let clampedBMI = min(max(bmi, minBMI), maxBMI)
            let percentage = (clampedBMI - minBMI) / (maxBMI - minBMI)
            let angle = minAngle + percentage * (maxAngle - minAngle)
            
            return angle
        }
    var body: some View {
        
        VStack {
            ZStack() {
                Chart(scores) { score in
                                    SectorMark(
                                        angle: .value("Values", score.value),
                                        innerRadius: .ratio(0.50),
                                        outerRadius: .ratio(1)
                                    )
                                    .foregroundStyle(score.color)
                                    .foregroundStyle(
                                        by: .value("Type", score.type)
                                    )
                                }
                                .rotationEffect(.degrees(-90)) // Start at top
                                .chartLegend(.hidden) // Show legend for categories
                                .frame(width: 350, height: 350)
                
                Image("BMIarrow").resizable().scaledToFit().frame(width: 100).padding(.trailing,100).rotationEffect(.degrees(arrowAngle))
            }
           

        }
    }
}

#Preview {
    ChartBMI(bmi: 16.0)
}

//case ..<16:
//    return "Severe Thinness"
//case 16..<17:
//    return "Moderate Thinness"
//case 17..<18.5:
//    return "Mild Thinness"
//case 18.5..<25:
//    return "Normal"
//case 25..<30:
//    return "Overweight"
//case 30..<35:
//    return "Obese Class I"
//case 35..<40:
//    return "Obese Class II"
//default:
//    return "Obese Class III"
