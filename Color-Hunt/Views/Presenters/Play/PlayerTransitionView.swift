import SwiftUI

struct PlayerTransitionView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        VStack {
            Text("Player \(playViewModel.currentPlayer)")
                .font(.title)
                .fontWeight(.bold)
            
            Button(action: {
                playViewModel.isPlayerTransition = false
            }) {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(24)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
        }
    }
}

#Preview {
    PlayerTransitionView()
}
