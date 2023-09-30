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
        let label = TextLabel()
        label.foregroundColor = .black
        label.backgroundColor = .clear
        label.text = .string("Test label")
        return label
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
