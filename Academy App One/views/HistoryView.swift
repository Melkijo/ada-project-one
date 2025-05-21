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
    @Environment(\.modelContext) private var modelContext
    
    let sampleHistories = sampleData.histories
    
    @State private var isDeleteAlertPresented: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment: .leading){
                    
                    if (historyItems.isEmpty){
                        Text("No History Found")
                              .font(.title3)
                              .fontWeight(.bold)
                              // make the Text take up all available space…
                              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                              // …and center its text
                              .multilineTextAlignment(.center)
                       
                    }else{
                        Text("BMI Progress").font(.title3).fontWeight(.bold).padding(EdgeInsets(top: 20, leading: 0, bottom: 8, trailing: 8))
                        HistoryChart(historyData:  historyItems)
                        
                        HStack {
                                                    Text("Latest BMI check")
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 8, trailing: 8))
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        isDeleteAlertPresented = true
                                                    }) {
                                                        Text("Delete All")
                                                            .foregroundColor(.red)
                                                    }
                                                    .padding(.trailing, 8)
                                                }
                        
                        
                        VStack(alignment: .center, spacing: 8) {
                            
                            ForEach(historyItems) { item in
                                                        SwipeToDelete(content: {
                                                            HistoryItem(
                                                                bmiScore: item.score,
                                                                date: item.date,
                                                                weight: item.weight,
                                                                height: item.height
                                                            )
                                                        }, onDelete: {
                                                            deleteItem(item)
                                                        })
                                                    }

                        }
                        
                        .frame(maxWidth: .infinity)
                    }
                    
                   
                }.padding(.horizontal, 8)
                    .padding(.top,12)
                    .frame(maxWidth: .infinity)
                
                
                
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
                .alert("Delete All History", isPresented: $isDeleteAlertPresented) {
                                Button("Cancel", role: .cancel) {}
                                Button("Delete All", role: .destructive) {
                                    deleteAllHistory()
                                }
                            } message: {
                                Text("Are you sure you want to delete all BMI history? This action cannot be undone.")
                            }
            
        }
    }
    
    private func deleteItem(_ item: HistoryBMI) {
            withAnimation {
                modelContext.delete(item)
                try? modelContext.save()
            }
        }
    
    private func deleteAllHistory() {
           withAnimation {
               for item in historyItems {
                   modelContext.delete(item)
               }
               try? modelContext.save()
           }
       }
}
    
    

#Preview {
    HistoryView()
}
