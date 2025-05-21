//
//  HistoryBMI.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 20/03/25.
//

import Foundation
import SwiftData

@Model
class HistoryBMI {
    @Attribute(.unique) var id: String
    var score: Double
    var category: String
    var date: Date
    var height: Double
    var weight: Double
    var age: Int
    var gender: String
    
    init(id: String, bmiScore: Double, category: String, date: Date, height: Double, weight: Double, age: Int, gender: String) {
        self.id = id
        self.score = bmiScore
        self.category = category
        self.date = date
        self.height = height
        self.weight = weight
        self.age = age
        self.gender = gender
    }
    
}
