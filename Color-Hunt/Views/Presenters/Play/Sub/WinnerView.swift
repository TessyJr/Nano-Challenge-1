import SwiftUI

struct WinnerView: View {
    // Environment object for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    // Environment variable to manage presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            backgroundImageView(for: playViewModel.winner!)
            
            VStack {
                transitionImageView(for: playViewModel.winner!)
                    .offset(x: -18)
                transitionButtonView(for: playViewModel.winner!)
            }
        }
    }
    
    private func backgroundImageView(for winner: Result) -> some View {
        switch winner.playerNumber {
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
    
    private func transitionImageView(for winner: Result) -> some View {
        switch winner.playerNumber {
        case 1:
            return Image("winnerPlayer1")
        case 2:
            return Image("winnerPlayer2")
        case 3:
            return Image("winnerPlayer3")
        case 4:
            return Image("winnerPlayer4")
        default:
            return Image("winnerPlayer1")
        }
    }
    
    private func transitionButtonView(for winner: Result) -> some View {
        switch winner.playerNumber {
        case 1:
            return Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "house.circle.fill")
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
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "house.circle.fill")
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
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "house.circle.fill")
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
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "house.circle.fill")
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
                presentationMode.wrappedValue.dismiss()
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

#Preview {
    WinnerView()
}
