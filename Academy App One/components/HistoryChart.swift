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
    var historyData: [HistoryBMI]
    
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
                            ForEach(historyData) { data in
                                LineMark(
                                    x: .value("Date", data.date),
                                    y: .value("Score", data.score > 40 ? 40 : data.score)
                                )
                                .symbol(Circle().strokeBorder(lineWidth: 2))
                                .symbolSize(30)
                            }
                            
                            ForEach(historyData) { data in
                                PointMark(
                                    x: .value("Date", data.date),
                                    y: .value("Score",  data.score > 40 ? 40 : data.score)
                                )
                                .opacity(0)
                                .annotation(position: .top) {
                                    Text(String(format: "%.1f", data.score))
                                        .font(.caption2)
                                        .padding(4)
                                        .background(Color("Light").opacity(0.8))
                                        .cornerRadius(4)
                                }
                            }
                        }
                        .frame(width: max(CGFloat(historyData.count) * 50, UIScreen.main.bounds.width - 35), height: 350)
                        .foregroundStyle(Color("Dark"))
                        .chartXScale(domain: calculateDateRange())
                        .chartYScale(domain: 10...40)  // Fixed y-axis range
                        .chartYAxis(.hidden)  // Hide the built-in y-axis
                    }
                }
            }
        }
        .padding(.vertical)
        .background(Color("Light"))
        .cornerRadius(8)
    }
    
    // Helper function to calculate an appropriate date range for the chart
    private func calculateDateRange() -> ClosedRange<Date> {
        if historyData.isEmpty {
            // Default range if no data
            return (Calendar.current.date(byAdding: .day, value: -10, to: Date())!) ... Date()
        }
        
        // Find min and max dates in the history data
        let sortedDates = historyData.map { $0.date }.sorted()
        
        if let firstDate = sortedDates.first, let lastDate = sortedDates.last {
            // Add some padding to both ends
            let startDate = Calendar.current.date(byAdding: .day, value: -1, to: firstDate) ?? firstDate
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: lastDate) ?? lastDate
            return startDate ... endDate
        } else {
            // Fallback
            return (Calendar.current.date(byAdding: .day, value: -10, to: Date())!) ... Date()
        }
    }
}

// Extension to make HistoryBMI conform to Identifiable, which is required for ForEach
extension HistoryBMI: Identifiable {}

//#Preview {
//HistoryChart()
//}

