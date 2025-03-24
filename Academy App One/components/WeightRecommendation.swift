//
//  WeightRecommendation.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 21/03/25.
//

import SwiftUI

struct WeightRecommendation: View {
    let height: Double
    
    let minNormalBMI = 18.5
    let maxNormalBMI = 24.9
    
    var heightInMeters: Double {
        return height / 100
    }
           
    // Calculate properties
        var minWeight: Double {
            return minNormalBMI * (heightInMeters * heightInMeters )
        }
        
        var maxWeight: Double {
            return maxNormalBMI * (heightInMeters  * heightInMeters )
        }
    
    var body: some View {
        
        HStack {
            VStack(alignment:.leading){
                Text("Normal weight :").fontWeight(.semibold)
                Text("Based on your height").fontWeight(.light).foregroundStyle(Color("BodyText")).font(.footnote)
            }
           
            Spacer()
            HStack {
                Text("\(String(format: "%.2f", minWeight)) kg")
                Text(" - ")
                Text("\(String(format: "%.2f", maxWeight)) kg")
            }.font(.title3).fontWeight(.semibold)
        }
        .padding(EdgeInsets(top: 20, leading: 12, bottom: 20, trailing: 12))
        .background(Color("Light"))
        
        .cornerRadius(8)
    }
}

#Preview {
    WeightRecommendation(height: 170)
}
