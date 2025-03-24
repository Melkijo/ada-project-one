//
//  Keyboard+Extensions.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 24/03/25.
//
import SwiftUI


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
