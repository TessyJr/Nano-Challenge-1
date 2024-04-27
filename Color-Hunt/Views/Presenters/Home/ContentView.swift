import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            NavigationLink(destination: PlayView().environmentObject(PlayViewModel()).navigationBarBackButtonHidden()) {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(24)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
