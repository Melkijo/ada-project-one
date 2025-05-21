//
//  SwipeToDelete.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 21/05/25.
//

import SwiftUI

// Custom SwipeToDelete view component
struct SwipeToDelete<Content: View>: View {
    var content: () -> Content
    var onDelete: () -> Void
    
    @State private var offset: CGFloat = 0
    @State private var isSwiped = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Delete button background
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 88)
                .overlay(
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .font(.title2)
                )
            
            // Main content
            content()
                .background(Color("Light"))
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width < 0 {
                                // Limit the drag to -88 points (width of delete button)
                                offset = max(value.translation.width, -88)
                            }
                        }
                        .onEnded { value in
                            withAnimation {
                                if value.translation.width < -50 {
                                    // Swiped far enough to reveal delete button
                                    offset = -88
                                    isSwiped = true
                                } else {
                                    // Reset position
                                    offset = 0
                                    isSwiped = false
                                }
                            }
                        }
                )
                .onTapGesture {
                    if isSwiped {
                        withAnimation {
                            offset = 0
                            isSwiped = false
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .overlay(
            // Tap area for delete button
            Group {
                if isSwiped {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 88)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                offset = 0
                                isSwiped = false
                                onDelete()
                            }
                        }
                        .transition(.opacity)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        )
    }
}
