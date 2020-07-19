//
//  StyleManager.swift
//  PillButtonApp
//
//  Created by Mariin on 19.07.20.
//

import Foundation
import SwiftUI

class StyleManager: ObservableObject {
    enum Style {
        case retro, contemporary
    }
    @Published var style: Style = .contemporary
    
    var isRetro = false {
        didSet {
            style = isRetro ? .retro : .contemporary
        }
    }
}
