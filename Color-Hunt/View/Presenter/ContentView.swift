//
//  ContentView.swift
//  Color-Hunt
//
//  Created by Christopher Nathanael Tessy on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            NavigationLink(destination: PlayerNumberView()) {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(24)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
