//
//  PillButtonStyle.swift
//  PillButtonApp
//
//  Created by Mariin on 19.07.20.
//

import Foundation
import SwiftUI

func rgb(_ r: Int, _ g: Int, _ b: Int, _ a: Double = 1.0) -> Color {
    return Color(red: Double(r)/255.0, green: Double(g)/255.0, blue: Double(b)/255.0, opacity: a)
}

extension PillButtonStyle {
    static let bgGradient = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: rgb(52, 108, 196), location: 0.0),
            Gradient.Stop(color: rgb(119, 173, 230), location: 0.5),
            Gradient.Stop(color: rgb(178, 232, 255), location: 1.0),
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let fgGradient = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: rgb(255, 255, 255), location: 0.0),
            Gradient.Stop(color: rgb(255, 255, 255, 0.8), location: 0.5),
            Gradient.Stop(color: rgb(255, 255, 255, 0.2), location: 1.0),
        ]),
        startPoint: .top,
        endPoint: .bottom
    )

    static let borderGradient = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: rgb(54, 57, 164), location: 0.0),
            Gradient.Stop(color: rgb(113, 114, 124), location: 0.5),
            Gradient.Stop(color: rgb(117, 117, 117), location: 1.0),
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
}

struct PillButtonStyle: ButtonStyleModifier {
    var isPressed = false
    var role: ButtonRole = .default
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 100)
            .padding(.horizontal)
            .padding(.vertical, 6)
            .font(.headline)
            .foregroundColor(rgb(33, 43, 34))
            .shadow(radius: 4)
            .background(
                ZStack {
                    GeometryReader { metrics in
                        Capsule()
                            .scale(x: 0.9)
                            .offset(x: 0, y: metrics.size.height * 0.33)
                            .fill(rgb(178, 232, 255))
                            .blur(radius: 6.0)
                            .padding(.all, 10)

                        ZStack {
                            PillButtonStyle.bgGradient
                                .clipShape(Capsule())

                            PillButtonStyle.fgGradient
                                .blur(radius: 3.0, opaque: false)
                                .opacity(0.7)
                                .clipShape(Capsule(style: .continuous))
                                .padding(.horizontal, metrics.size.width * 0.012)
                                .frame(height: metrics.size.height * 0.42, alignment: .center)
                                .offset(x: 0, y: metrics.size.height * -0.3)
                        }
                        .clipShape(Capsule())
                        
                        Capsule()
                            .strokeBorder(PillButtonStyle.borderGradient, lineWidth: 1.5, antialiased: true)
                            .shadow(radius: 2.0)
                    }
                }
                .brightness(isPressed ? -0.1 : 0.0)
                .animation(.easeIn(duration: 0.15))
                .saturation(role == .standard ? 0.0 : 1.0)
                .brightness(role == .standard ? 0.15 : 0.0)
            )
            .padding(.horizontal, 4)
    }
}
