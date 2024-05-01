import SwiftUI

struct PlayerTransitionView: View {
    // Environment object for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var isButtonDisabled: Bool = true
    @State var opacity: Double = 0.0
    
    var body: some View {
        ZStack {
            backgroundImageView(for: playViewModel.currentPlayer)
            
            VStack {
                transitionImageView(for: playViewModel.currentPlayer)
                transitionButtonView(for: playViewModel.currentPlayer)
                    .disabled(isButtonDisabled)
            }
            .opacity(opacity)
        }
        .animation(.easeIn(duration: 0.5), value: opacity)
        .onAppear() {
            opacity = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isButtonDisabled = false
            }
        }
    }
    
    private func backgroundImageView(for currentPlayer: Int) -> some View {
        switch currentPlayer {
        case 1:
            return Image("backgroundTeal")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        case 2:
            return Image("backgroundOrange")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        case 3:
            return Image("backgroundPink")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        case 4:
            return Image("backgroundPurple")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        default:
            return Image("backgroundTeal")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func transitionImageView(for currentPlayer: Int) -> some View {
        switch currentPlayer {
        case 1:
            return Image("cardPlayer1")
        case 2:
            return Image("cardPlayer2")
        case 3:
            return Image("cardPlayer3")
        case 4:
            return Image("cardPlayer4")
        default:
            return Image("cardPlayer1")
        }
    }
    
    private func transitionButtonView(for currentPlayer: Int) -> some View {
        switch currentPlayer {
        case 1:
            return Button(action: {
                playViewModel.isPlayerTransition = false
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.horizontal, 128)
                    .padding(.vertical, 16)
                    .foregroundColor(Color.customTeal)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        case 2:
            return Button(action: {
                playViewModel.isPlayerTransition = false
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.horizontal, 128)
                    .padding(.vertical, 16)
                    .foregroundColor(Color.customOrange)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        case 3:
            return Button(action: {
                playViewModel.isPlayerTransition = false
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.horizontal, 128)
                    .padding(.vertical, 16)
                    .foregroundColor(Color.customPink)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        case 4:
            return Button(action: {
                playViewModel.isPlayerTransition = false
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.horizontal, 128)
                    .padding(.vertical, 16)
                    .foregroundColor(Color.customPurple)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        default:
            return Button(action: {
                playViewModel.isPlayerTransition = false
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.horizontal, 128)
                    .padding(.vertical, 16)
                    .foregroundColor(Color.customTeal)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        }
    }
}

struct PlayerTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTransitionView()
            .environmentObject(PlayViewModel()) // Assuming PlayViewModel is your view model
    }
}
