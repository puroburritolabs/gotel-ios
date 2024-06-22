//
//  ContentView.swift
//  Gotel
//
//  Created by Andres Lopez on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Gotel !")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
