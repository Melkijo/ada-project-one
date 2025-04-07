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
}

struct sampleData{
    static let histories: [History] = [
        History(score: 22.5, date: Date()),
        History(score: 24.1, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!),
        History(score: 26.3, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!),
        History(score: 21.0, date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!),
        History(score: 23.7, date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!),
        History(score: 25.4, date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!),
        History(score: 27.2, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!),
        History(score: 20.8, date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!),
        History(score: 22.9, date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!),
        History(score: 24.6, date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!)
    ]
}

