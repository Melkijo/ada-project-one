//
//  HistoryView.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 20/03/25.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Query private var historyItems: [HistoryBMI]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .center, spacing: 12) {
                    if historyItems.isEmpty {
                        Text("No BMI history found")
                            .foregroundColor(.secondary)
                            .padding()
                    } else {
                        ForEach(historyItems.sorted(by: { $0.date > $1.date })) { item in
                            HistoryItem(
                                bmiScore: item.score,
                                date: item.date
                            )
                        }
                    }
                }
                .padding(.top,20).padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
                
            }
    
            .background(Color.gray.opacity(0.05))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                       Text("History")
                           .font(.custom("ArchivoBlack-Regular", size: 24))
                           .foregroundStyle(Color("Dark"))
                   }
                   
                   ToolbarItem(placement: .navigationBarLeading) {
                       Button(action: {
                           dismiss()
                       }) {
                           HStack {
                               Image(systemName: "chevron.left")
                               Text("Back")
                           }.foregroundStyle(.blue)
                       }
                   }
            }.toolbarBackground(.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            
            
        }
    }
}

#Preview {
    HistoryView()
}
