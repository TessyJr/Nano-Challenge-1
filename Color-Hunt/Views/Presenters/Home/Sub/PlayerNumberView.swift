import SwiftUI

struct PlayerNumberView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        ZStack {
            Image("backgroundBlue")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        playViewModel.isSelectingPlayerNumber = false
                    }) {
                        Image(systemName: "arrowshape.left.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(16)
                            .foregroundColor(Color.customBlue)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(.leading, 54)
                    
                    Spacer()
                }
                
                PlayerNumberButton(playerNumber: 1)
                PlayerNumberButton(playerNumber: 2)
                PlayerNumberButton(playerNumber: 3)
                PlayerNumberButton(playerNumber: 4)
            }
        }
    }
}

struct PlayerNumberButton: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    let playerNumber: Int
    
    var body: some View {
        NavigationLink(destination: PlayView().navigationBarBackButtonHidden()) {
            Image("selectPlayer\(playerNumber)")
        }
        .simultaneousGesture(TapGesture().onEnded {
            playViewModel.playerNumber = playerNumber
            playViewModel.isPlayerTransition = true
        })
        .onDisappear() {
            playViewModel.isSelectingPlayerNumber = false
        }
        .padding(.bottom, -32)
    }
}


#Preview {
    PlayerNumberView()
}
