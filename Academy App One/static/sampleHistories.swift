//
//  sampleHistories.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 07/04/25.
//
import Foundation
struct History: Identifiable {
    var id = UUID()
    var score: Double
    var date: Date
    var weight: Double  // dalam kg
    var height: Double  // dalam cm
}

struct sampleData{
    static let histories: [History] = [
        History(score: 22.5, date: Date(), weight: 60.0, height: 164.0),
        History(score: 24.1, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, weight: 63.5, height: 162.0),
        History(score: 26.3, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, weight: 68.0, height: 161.0),
        History(score: 21.0, date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, weight: 58.0, height: 166.0),
        History(score: 23.7, date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, weight: 62.0, height: 165.0),
        History(score: 25.4, date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, weight: 66.0, height: 161.0),
        History(score: 27.2, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, weight: 70.0, height: 160.0),
        History(score: 20.8, date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, weight: 55.0, height: 168.0),
        History(score: 22.9, date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!, weight: 59.0, height: 167.0),
        History(score: 24.6, date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!, weight: 61.0, height: 165.0)
    ]

}

