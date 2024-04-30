import SwiftUI

struct HomeView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("backgroundBlue")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                if playViewModel.isSelectingPlayerNumber {
                    // Select player number
                    PlayerNumberView()
                } else {
                    // Start page
                    StartView()
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
