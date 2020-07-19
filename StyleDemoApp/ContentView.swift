import SwiftUI

struct ContentView: View {
    @EnvironmentObject var styleManager: StyleManager
    @State var text = "create"
    
    var body: some View {
        Group {
            VStack {
                Text("Would you like to \(text) a project?")
                    .font(.title2)
                    .padding(.bottom, 40)
                
                HStack {
                    Button(action: { text = "cancel" }) {
                        Text("Cancel")
                    }
                    .buttonStyle(ManagedButtonStyle(role: .standard, style: $styleManager.style))

                    Button(action: { text = "create" }) {
                        Text("Create")
                    }
                    .buttonStyle(ManagedButtonStyle(role: .default, style: $styleManager.style))
                }
            }
        }
        .frame(width: 400, height: 140, alignment: .center)
        .background(ManagedBackgroundStyle(style: $styleManager.style))
        .toolbar {
            Toggle(isOn: $styleManager.isRetro) { }
                .scaleEffect(0.67)
                .toggleStyle(SwitchToggleStyle())
                .font(.caption2)
        }
    }
}
