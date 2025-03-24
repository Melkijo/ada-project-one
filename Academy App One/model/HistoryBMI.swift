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
    
    init(id: String, bmiScore: Double, category: String, date: Date) {
        self.id = id
        self.score = bmiScore
        self.category = category
        self.date = date
    }
    
}
