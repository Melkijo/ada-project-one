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
            // Set the background color at the ZStack level
                       Color("LightBg")
                           .ignoresSafeArea() // This extends the color to the edges
            if self.isActive {
                ContentView()
            } else {
                Image("splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
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
