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
}

