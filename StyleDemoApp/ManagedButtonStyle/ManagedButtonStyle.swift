//
//  ManagedButtonStyle.swift
//  PillButtonApp
//
//  Created by Mariin on 19.07.20.
//

import Foundation
import SwiftUI

enum ButtonRole {
    case `default`, standard
}

protocol ButtonStyleModifier: ViewModifier {
    var isPressed: Bool { get }
    var role: ButtonRole { get }
}

struct ManagedButtonStyle: ButtonStyle {
    var role: ButtonRole
    var style: Binding<StyleManager.Style>
    
    init(role: ButtonRole, style: Binding<StyleManager.Style>) {
        self.role = role
        self.style = style
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        switch style.wrappedValue {
        case .retro:
            return AnyView(configuration.label
                .modifier(PillButtonStyle(isPressed: configuration.isPressed, role: role)))
        case .contemporary:
            return AnyView(configuration.label
                .modifier(ModernButtonStyle(isPressed: configuration.isPressed, role: role)))
        }
    }
}
