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
    
    @State private var isActive: Bool = false
    
    @State private var scores: [Score] = [
        .init(type: "Severe Thinness", value: 5, color: Color("MainBlue")),       // <16.0
        .init(type: "Moderate Thinness", value: 2, color: Color("MainBlue1")),  // 16.0-17.0
        .init(type: "Mild Thinness", value: 3, color: Color("MainBlue2")),      // 17.0-18.5
        .init(type: "Normal", value: 13, color: Color("MainGreen")),              // 18.5-25.0
        .init(type: "Overweight", value: 10, color: Color("MainYellow")),         // 25.0-30.0
        .init(type: "Obese Class I", value: 10, color: Color("MainRed")),      // 30.0-35.0
        .init(type: "Obese Class II", value: 10, color: Color("MainRed1")),        // 35.0-40.0
        .init(type: "Obese Class III", value: 10, color: Color("MainRed2")),     // >40.0
        .init(type: "", value: 63, color: Color("LightBg"))
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
                                .rotationEffect(.degrees(-90))
                                .chartLegend(.hidden)
                                .frame(width: 350, height: 350)
                
                Image("BMIarrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.trailing,100)
                    .rotationEffect(.degrees(isActive ? arrowAngle : 0))
                    .animation(.bouncy(duration: 0.8, extraBounce:  (0.1)), value: isActive)
                
                Image("indicatorBottom").resizable().scaledToFit().frame(width: 50).padding(.bottom,20)
            }
           

        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    ChartBMI(bmi: 32.0)
}
