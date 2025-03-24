//
//  getBMIcategory.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 22/03/25.
//
import SwiftUI

func getBMICategory(bmi: Double) -> BMICategory {
    switch bmi {
    case ..<16:
        return BMICategory(name: "Severe Thinness", color: Color("MainBlue"))
    case 16..<17:
        return BMICategory(name: "Moderate Thinness", color: Color("MainBlue1"))
    case 17..<18.5:
        return BMICategory(name: "Mild Thinness", color: Color("MainBlue2"))
    case 18.5..<25:
        return BMICategory(name: "Normal", color: Color("MainGreen"))
    case 25..<30:
        return BMICategory(name: "Overweight", color: Color("MainYellow"))
    case 30..<35:
        return BMICategory(name: "Obese Class I", color: Color("MainRed"))
    case 35..<40:
        return BMICategory(name: "Obese Class II", color: Color("MainRed1"))
    default:
        return BMICategory(name: "Obese Class III", color: Color("MainRed2"))
    }
}
