//
//  ManagedWindowBackground.swift
//  PillButtonApp
//
//  Created by Mariin on 19.07.20.
//

import Foundation
import SwiftUI

struct ManagedBackgroundStyle: View {
    var style: Binding<StyleManager.Style>
    
    init(style: Binding<StyleManager.Style>) {
        self.style = style
    }
    
    var body: some View {
        switch style.wrappedValue {
        case .retro:
            return AnyView(Image("stripes").resizable(capInsets: EdgeInsets(), resizingMode: .tile).opacity(0.33))

        case .contemporary:
            return AnyView(
                LinearGradient(
                    gradient: Gradient(stops: [
                        Gradient.Stop(color: rgb(225, 225, 225), location: 0.0),
                        Gradient.Stop(color: rgb(200, 200, 200), location: 1.0),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}
