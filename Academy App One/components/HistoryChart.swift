//
//  HistoryChart.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 25/03/25.
//

import SwiftUI
import Charts
import SwiftData

struct BMILineChartView: View {
    var historyData: [HistoryBMI]
    @Query private var historyItems: [HistoryBMI]
    var body: some View {
        VStack(alignment: .leading) {
            Text("BMI History")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            VStack{
                ForEach(historyItems.sorted(by: { $0.date > $1.date })) { item in
                    HistoryItem(
                        bmiScore: item.score,
                        date: item.date
                    )
                }

            }
            
            Chart {
                ForEach(historyItems, id: \.id) { entry in
                    LineMark(
                        x: .value("Date", entry.date),
                        y: .value("BMI", entry.score)
                    )
                    .interpolationMethod(.cardinal)
                    .symbol {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10)
                    }
                    
                    PointMark(
                        x: .value("Date", entry.date),
                        y: .value("BMI", entry.score)
                    )
                    .annotation(position: .top) {
                        Text(String(format: "%.1f", entry.score))
                            .font(.caption)
                    }
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel {
                        if let date = value.as(Date.self) {
                            Text(date, style: .date)
                                .font(.caption)
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: 300)
            .padding()
            
            // BMI category legend
            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(Set(historyData.map { $0.category })).sorted(), id: \.self) { category in
                    HStack {
                        Circle()
                            .fill(colorForCategory(category))
                            .frame(width: 12, height: 12)
                        Text(category)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func colorForCategory(_ category: String) -> Color {
        switch category.lowercased() {
        case "underweight":
            return .blue
        case "normal":
            return .green
        case "overweight":
            return .orange
        case "obese":
            return .red
        default:
            return .gray
        }
    }
}

// Preview provider
struct BMILineChartView_Previews: PreviewProvider {
    static var previewData: [HistoryBMI] {
        let calendar = Calendar.current
        let today = Date()
        return [
            HistoryBMI(id: "1", bmiScore: 18.5, category: "Underweight", date: calendar.date(byAdding: .day, value: -30, to: today)!),
            HistoryBMI(id: "2", bmiScore: 20.0, category: "Normal", date: calendar.date(byAdding: .day, value: -20, to: today)!),
            HistoryBMI(id: "3", bmiScore: 22.5, category: "Normal", date: calendar.date(byAdding: .day, value: -15, to: today)!),
            HistoryBMI(id: "4", bmiScore: 25.5, category: "Overweight", date: calendar.date(byAdding: .day, value: -10, to: today)!),
            HistoryBMI(id: "5", bmiScore: 27.0, category: "Overweight", date: calendar.date(byAdding: .day, value: -5, to: today)!),
            HistoryBMI(id: "6", bmiScore: 30.5, category: "Obese", date: today)
        ]
    }
    
    static var previews: some View {
        BMILineChartView(historyData: previewData)
            .padding()
    }
}
