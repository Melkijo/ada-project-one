//
//  Date+Extensions.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 20/03/25.
//
import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: self)
    }
    
    func adding (_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
            return calendar.date(byAdding: component, value: value, to: self)
        }

        var startOfDay: Date {
            return Calendar.current.startOfDay(for: self)
        }
}

