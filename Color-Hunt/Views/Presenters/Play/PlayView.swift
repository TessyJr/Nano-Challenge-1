import SwiftUI
import PhotosUI
import ColorKit

struct PlayView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        if playViewModel.isGameOver {
            // Game Over
            ResultView()
                .onDisappear {
                    playViewModel.resetGame()
                }
        } else if playViewModel.isSelectingPlayerNumber {
            // Select player number
            PlayerNumberView()
        } else if playViewModel.isPlayerTransition {
            // Change player
            PlayerTransitionView()
        } else {
            // Player's turn
            PlayerTurnView()
        }
    }
}

#Preview {
    PlayView()
        .environmentObject(PlayViewModel())
}
