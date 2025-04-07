//
//  HistoryItem.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 20/03/25.
//

import SwiftUI

struct HistoryItem: View {
    let bmiScore: Double
    let date: Date
    
    var bmiCategory: BMICategory {
        getBMICategory(bmi: bmiScore)
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .trailing, spacing:8){
                
                HStack{
                    VStack(alignment:.leading){
                        Text("\(bmiCategory.name)").padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24)).background(bmiCategory.color).cornerRadius(8).fontWeight(.medium).font(.footnote).foregroundStyle(Color("LightBg"))
                        Spacer()
                        Text(String(format: "%.1f",bmiScore)).font(.largeTitle).fontWeight(.black).padding(.leading,8)
                        
                    }
                    Spacer()
                    
                    VStack(alignment:.trailing){
                        Text("\(date.formattedDate())").foregroundStyle(.secondary)
                        Spacer()
//                        Image(systemName: "chevron.right").foregroundColor(.secondary)
                    }.padding(.vertical,12)
                   
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .padding(20)
            .background(Color("Light"))
            .cornerRadius(8)
        }
    }
}

#Preview {
    HistoryItem(bmiScore: 25.0, date: Date())
}
