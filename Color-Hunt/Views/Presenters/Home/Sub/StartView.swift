import SwiftUI

struct StartView: View, Animatable {
    // Environment object for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    // State variable to track if the popover should be shown
    @State private var showHowToPlay = false
    
    let score = 93.21
    @State var value1: Double = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                Image("startIcon")
                
                HStack(spacing: 16) {
                    Button(action: {
                        playViewModel.isSelectingPlayerNumber = true
                    }) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .padding(.horizontal, 84)
                            .padding(.vertical, 16)
                            .foregroundColor(Color.customBlue)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    
                    Button(action: {
                        self.showHowToPlay = true
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .padding(16)
                            .foregroundColor(Color.customBlue)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                }
            }
            
            // How to play overlay
            if showHowToPlay {
                ZStack {
                    Color.black.opacity(0.75)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            self.showHowToPlay = false
                        }
                    
                    VStack{
                        Image("howToPlay")
                    }
                    .padding(.vertical, 32)
                    .padding(.horizontal, 64)
                    .background(Color.white)
                    .cornerRadius(16)
                }
            }
        }
    }
}

#Preview {
    StartView()
}
