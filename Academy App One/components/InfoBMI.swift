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
                   HStack {
                       HStack {
                           Circle().fill(Color("MainBlue")).frame(width: 15, height: 15)
                           Text("Severe Thinness")
                       }
                       Spacer()
                       Text("<16")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi < 16 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainBlue1")).frame(width: 15, height: 15)
                           Text("Moderate Thinness")
                       }
                       Spacer()
                       Text("16 - 16.9")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 16 && bmi < 17 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainBlue2")).frame(width: 15, height: 15)
                           Text("Mild Thinness")
                       }
                       Spacer()
                       Text("17 - 18.4")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 17 && bmi < 18.5 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainGreen")).frame(width: 15, height: 15)
                           Text("Normal")
                       }
                       Spacer()
                       Text("18.5 - 24.9")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 18.5 && bmi < 25 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainYellow")).frame(width: 15, height: 15)
                           Text("Overweight")
                       }
                       Spacer()
                       Text("25 - 29.9")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 25 && bmi < 30 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainRed")).frame(width: 15, height: 15)
                           Text("Obese Class I")
                       }
                       Spacer()
                       Text("30 - 34.9")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 30 && bmi < 35 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainRed1")).frame(width: 15, height: 15)
                           Text("Obese Class II")
                       }
                       Spacer()
                       Text("35 - 39.9")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 35 && bmi < 40 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
                   
                   HStack {
                       HStack {
                           Circle().fill(Color("MainRed2")).frame(width: 15, height: 15)
                           Text("Obese Class III")
                       }
                       Spacer()
                       Text("≥40")
                   }
                   .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                   .background(bmi >= 40 ? Color.yellow : Color.clear)
                   .cornerRadius(8)
        }.background(Color("Light"))
               
    }
}

#Preview {
    InfoBMI(bmi: 16.5)
}
