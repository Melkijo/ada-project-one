//
//  calculateBMI.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 22/03/25.
//
import SwiftUI

func calculateBMI(gender: String, age: Int, weight: Double, height: Double) -> Double {
    
    // Ensure height is greater than 0 to avoid division by zero
    guard height > 0 else {
        return 0.0
    }
    
    let heightM = height / 100.0
    // Calculate BMI
    let bmi = weight / (heightM * heightM)
    
    // Round to one decimal place
    return round(bmi * 10) / 10
}
