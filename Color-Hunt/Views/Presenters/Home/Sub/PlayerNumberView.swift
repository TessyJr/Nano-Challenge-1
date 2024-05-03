import SwiftUI

struct PlayerNumberView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    // State variables for animation
    @State var opacityBtn1: Double = 0.0
    @State var opacityBtn2: Double = 0.0
    @State var opacityBtn3: Double = 0.0
    @State var opacityBtn4: Double = 0.0
    @State var offsetXBtn1: Double = -32.0
    @State var offsetXBtn2: Double = -32.0
    @State var offsetXBtn3: Double = -32.0
    @State var offsetXBtn4: Double = -32.0
    @State var isDisabledBtn1: Bool = true
    @State var isDisabledBtn2: Bool = true
    @State var isDisabledBtn3: Bool = true
    @State var isDisabledBtn4: Bool = true
    
    @State var offsetXAll: Double = 500.0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.easeIn(duration: 0.2)) {
                        offsetXAll = 500.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        playViewModel.isSelectingPlayerNumber = false
                    }
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
            
            ZStack {
                PlayerNumberButton(playerNumber: 1)
                
                Image("selectPlayer1")
                    .opacity(isDisabledBtn1 ? 1.0 : 0.0)
                    .padding(.bottom, -32)
            }
            .opacity(opacityBtn1)
            .offset(x: offsetXBtn1)
            
            ZStack {
                PlayerNumberButton(playerNumber: 2)
                
                Image("selectPlayer2")
                    .opacity(isDisabledBtn2 ? 1.0 : 0.0)
                    .padding(.bottom, -32)
            }
            .opacity(opacityBtn2)
            .offset(x: offsetXBtn2)
            
            ZStack {
                PlayerNumberButton(playerNumber: 3)
                
                Image("selectPlayer3")
                    .opacity(isDisabledBtn3 ? 1.0 : 0.0)
                    .padding(.bottom, -32)
            }
            .opacity(opacityBtn3)
            .offset(x: offsetXBtn3)
            
            ZStack {
                PlayerNumberButton(playerNumber: 4)
                
                Image("selectPlayer4")
                    .opacity(isDisabledBtn4 ? 1.0 : 0.0)
                    .padding(.bottom, -32)
            }
            .opacity(opacityBtn4)
            .offset(x: offsetXBtn4)
        }
        .offset(x: offsetXAll)
        .onAppear() {
            withAnimation(.easeIn(duration:0.2)) {
                offsetXAll = 0.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeIn(duration: 0.2)) {
                    opacityBtn1 = 1.0
                    offsetXBtn1 = 0.0
                }
                
                withAnimation(.easeIn(duration: 0.2).delay(0.2)) {
                    opacityBtn2 = 1.0
                    offsetXBtn2 = 0.0
                }
                
                withAnimation(.easeIn(duration: 0.2).delay(0.4)) {
                    opacityBtn3 = 1.0
                    offsetXBtn3 = 0.0
                }
                
                withAnimation(.easeIn(duration: 0.2).delay(0.6)) {
                    opacityBtn4 = 1.0
                    offsetXBtn4 = 0.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isDisabledBtn1 = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isDisabledBtn2 = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isDisabledBtn3 = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isDisabledBtn4 = false
                            }
                        }
                    }
                }
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
        .padding(.bottom, -32)
        .simultaneousGesture(TapGesture().onEnded {
            playViewModel.playerNumber = playerNumber
            playViewModel.isPlayerTransition = true
        })
        .onDisappear() {
            playViewModel.isSelectingPlayerNumber = false
        }
    }
}


#Preview {
    PlayerNumberView()
}
