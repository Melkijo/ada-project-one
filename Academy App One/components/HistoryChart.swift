//
//  HistoryChart.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 25/03/25.
//

import SwiftUI
import Charts
import SwiftData

struct HistoryChart: View {
//    var historyData: [HistoryBMI]
//    @Query private var historyItems: [HistoryBMI]
    let sampleHistories = sampleData.histories
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                // Y-axis labels in fixed position
                VStack(alignment: .trailing, spacing: 0) {
                    Text("40").frame(height: 30)
                    Spacer()
                    
                    Text("30").frame(height: 30)
                    Spacer()
                    
                    Text("20").frame(height: 30)
                    Spacer()
                    Text("10").frame(height: 30)
                }
                .frame(width: 35)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 20)
                .padding(.bottom, 30)
                .zIndex(1)
                
                // Scrollable chart with padding for y-axis
                HStack(spacing: 0) {
                    // Empty space for y-axis
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 35)
                    
                    // Scrollable chart
                    ScrollView(.horizontal) {
                        Chart {
                            ForEach(sampleHistories) { d in
                                LineMark(
                                    x: .value("Date", d.date),
                                    y: .value("Score", d.score)
                                )
                                .symbol(Circle().strokeBorder(lineWidth: 2))
                                .symbolSize(30)
                            }
                            
                            ForEach(sampleHistories) { d in
                                PointMark(
                                    x: .value("Date", d.date),
                                    y: .value("Score", d.score)
                                )
                                .opacity(0)
                                .annotation(position: .top) {
                                    Text(String(format: "%.1f", d.score))
                                        .font(.caption2)
                                        .padding(4)
                                        .background(Color("Light").opacity(0.8))
                                        .cornerRadius(4)
                                }
                            }
                        }
                        .frame(width: CGFloat(sampleHistories.count) * 50, height: 350)
                        .foregroundStyle(Color("Dark"))
                        .chartXScale(domain: [
                            Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                            Calendar.current.date(byAdding: .day, value: 1, to: Date())!
                        ])
                        .chartYScale(domain: 10...40)  // Fixed y-axis range
                        .chartYAxis(.hidden)  // Hide the built-in y-axis
                    }
                }
            }
           
        }.padding(.vertical)
            .background(Color("Light"))
            
            .cornerRadius(8)
        
        
        }
    
    
    
}

#Preview {
HistoryChart()
}

