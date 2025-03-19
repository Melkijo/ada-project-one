//
//  SplashView.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 17/03/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                Image("BMI")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
