import SwiftUI
import PhotosUI
import ColorKit

struct PlayView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        if playViewModel.isGameOver {
            // Game Over
            if playViewModel.isShowingWinner {
                // Show winner
                WinnerView()
                    .onDisappear {
                        playViewModel.resetGame()
                    }
            } else {
                // Show score results
                switch playViewModel.playerNumber {
                case 1:
                    ResultOneView()
                case 2:
                    ResultTwoView()
                case 3:
                    ResultThreeView()
                case 4:
                    ResultFourView()
                default:
                    ResultView()
                }
            }
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
