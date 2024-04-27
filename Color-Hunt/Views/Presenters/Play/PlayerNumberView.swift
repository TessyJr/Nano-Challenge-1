import SwiftUI

struct PlayerNumberView: View {
    // Environment variable to manage presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            
            // player number buttons
            VStack{
                PlayerNumberButton(playerNumber: 1)
                PlayerNumberButton(playerNumber: 2)
                PlayerNumberButton(playerNumber: 3)
                PlayerNumberButton(playerNumber: 4)
            }
            
            Spacer()
            
            // Cancel button
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 256, height: 32)
                    .padding(24)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
            
        }
    }
}

struct PlayerNumberButton: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    let playerNumber: Int
    
    var body: some View {
        Button(action: {
            playViewModel.playerNumber = playerNumber
            playViewModel.isSelectingPlayerNumber = false
            playViewModel.isPlayerTransition = true
        }) {
            Text("\(playerNumber)")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 256, height: 32)
                .padding(24)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(16)
        }
    }
}


#Preview {
    PlayerNumberView()
}
