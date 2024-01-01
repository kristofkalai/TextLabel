//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 30/09/2023.
//

import SwiftUI
import TextLabel

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TextLabelWrapper()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct TextLabelWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let label = TextLabel<TextLayerWithAnimatableForegroundColor>()
        label.foregroundColor = .black
        label.backgroundColor = .white
        label.text = .string("Test label")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 2) {
                label.foregroundColor = .red
            }
        }
        return label
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
