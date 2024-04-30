//
//  Color_HuntApp.swift
//  Color-Hunt
//
//  Created by Christopher Nathanael Tessy on 23/04/24.
//

import SwiftUI

@main
struct Color_HuntApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(PlayViewModel())
        }
    }
}
