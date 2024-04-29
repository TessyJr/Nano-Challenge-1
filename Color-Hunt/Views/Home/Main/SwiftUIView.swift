//
//  SwiftUIView.swift
//  Color-Hunt
//
//  Created by Christopher Nathanael Tessy on 29/04/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Grid {
            GridRow {
                ZStack {
                    Image("backgroundBlack")
                    .resizable()
                    
                    Image("backgroundTeal")
                    .resizable()
                    .opacity(0)
                } 
                
                ZStack {
                    Image("backgroundBlack")
                    .resizable()
                    
                    Image("backgroundOrange")
                    .resizable()
                    .opacity(0)
                }
            }
            
            GridRow {
                ZStack {
                    Image("backgroundBlack")
                    .resizable()
                    
                    Image("backgroundPink")
                    .resizable()
                    .opacity(0)
                } 
                
                ZStack {
                    Image("backgroundBlack")
                    .resizable()
                }
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
