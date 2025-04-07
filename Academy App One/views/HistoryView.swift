//
//  HistoryView.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 20/03/25.
//

import SwiftUI
import SwiftData
import Charts



struct HistoryView: View {
    //    @Environment(\.dismiss) private var dismiss
    @State private var selectedIndex: Int = 0
    
    @Query private var historyItems: [HistoryBMI]
    
    
    let sampleHistories = sampleData.histories
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment: .leading){
                    
                    Text("BMI Progress").font(.title3).fontWeight(.bold).padding(EdgeInsets(top: 20, leading: 0, bottom: 8, trailing: 8))
                    HistoryChart()
                    
                    Text(" Latest BMI check").font(.title3).fontWeight(.bold).padding(EdgeInsets(top: 20, leading: 0, bottom: 8, trailing: 8))
                    VStack(alignment: .center, spacing: 8) {
                        if sampleHistories.isEmpty {
                            Text("No BMI history found")
                                .foregroundColor(.secondary)
                                .padding()
                        } else {
                            ForEach(sampleHistories) { item in
                                HistoryItem(
                                    bmiScore: item.score,
                                    date: item.date
                                )
                            }
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                }.padding(.horizontal, 8)
                    .padding(.top,12)
                
                
                
            }
            .background(Color("LightBg"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("History")
                        .font(.custom("ArchivoBlack-Regular", size: 20))
                        .foregroundStyle(Color("Dark"))
                }
                
                
            }.toolbarBackground(Color("Light"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            
            
        }
    }
}
    
    

#Preview {
    HistoryView()
}
