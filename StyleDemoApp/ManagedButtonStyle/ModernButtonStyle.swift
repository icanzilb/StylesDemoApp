//
//  ModernButtonStyle.swift
//  PillButtonApp
//
//  Created by Mariin on 19.07.20.
//

import Foundation
import SwiftUI

extension ModernButtonStyle {
    static let bgGradient = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: rgb(97, 182, 250), location: 0.0),
            Gradient.Stop(color: rgb(143, 190, 242), location: 0.5),
            Gradient.Stop(color: rgb(184, 220, 250), location: 0.75),
            Gradient.Stop(color: rgb(213, 241, 251), location: 1.0),
        ]),
        startPoint: .top,
        endPoint: .bottom
    )

    static let fgGradient = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: rgb(255, 255, 255), location: 0.0),
            Gradient.Stop(color: rgb(255, 255, 255, 0.8), location: 0.5),
            Gradient.Stop(color: rgb(255, 255, 255, 0.5), location: 1.0),
        ]),
        startPoint: .top,
        endPoint: .bottom
    )

    static let borderGradient = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: rgb(54, 57, 164), location: 0.0),
            Gradient.Stop(color: rgb(113, 114, 124), location: 0.5),
            Gradient.Stop(color: rgb(80, 82, 110), location: 1.0),
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
}

struct ModernButtonStyle: ButtonStyleModifier {
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
                        ZStack {
                            ModernButtonStyle.bgGradient

                            ModernButtonStyle.fgGradient
                                .opacity(role == .standard ? 0.2 : 0.6)
                                .padding(.horizontal, metrics.size.width * 0.012)
                                .frame(height: metrics.size.height * 0.42, alignment: .center)
                                .offset(x: 0, y: metrics.size.height * -0.3)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 4, style: .circular))

                        RoundedRectangle(cornerRadius: 4, style: .circular)
                            .strokeBorder(ModernButtonStyle.borderGradient, lineWidth: 1.5, antialiased: true)
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
