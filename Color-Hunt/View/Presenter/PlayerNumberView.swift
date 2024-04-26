//
//  PlayerNumberView.swift
//  Color-Hunt
//
//  Created by Christopher Nathanael Tessy on 26/04/24.
//

import SwiftUI

struct PlayerNumberView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: PlayView(playerNumber: 1).navigationBarHidden(true)) {
                Text("1")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 256, height: 32)
                    .padding(24)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
            NavigationLink(destination: PlayView(playerNumber: 2).navigationBarHidden(true)) {
                Text("2")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 256, height: 32)
                    .padding(24)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
            NavigationLink(destination: PlayView(playerNumber: 3).navigationBarHidden(true)) {
                Text("3")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 256, height: 32)
                    .padding(24)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
            NavigationLink(destination: PlayView(playerNumber: 4).navigationBarHidden(true)) {
                Text("4")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 256, height: 32)
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
    PlayerNumberView()
}
