import SwiftUI

struct ResultOneView: View, Animatable {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var scoreP1: Double = 0
    @State var opacityP1: Double = 0
    
    @State var isTappable: Bool = false
    
    var body: some View {
        Grid {
            GridRow {
                ZStack {
                    Image("backgroundTeal")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        VStack(spacing: 16) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.black)
                                        .frame(width: 112, height: 112)
                                    
                                    
                                    Image(uiImage: playViewModel.results[0].image)
                                        .resizable()
                                        .frame(width: 104, height: 104)
                                        .scaledToFit()
                                        .cornerRadius(16)
                                }
                                
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color.customTeal)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.black)
                                        .frame(width: 112, height: 112)
                                    
                                    if playViewModel.results[0].image == UIImage(named: "noPhoto") {
                                        Image("noPhoto")
                                            .resizable()
                                            .frame(width: 104, height: 104)
                                            .scaledToFit()
                                            .cornerRadius(16)
                                    } else {
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(playViewModel.results[0].averageColor)
                                            .frame(width: 104, height: 104)
                                    }
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(24)
                            
                            ZStack {
                                Image("targetPlayer1")
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.black)
                                        .frame(width: 68, height: 68)
                                    
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(playViewModel.results[0].targetColor)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(16)
                                }
                                .offset(x: 76, y: -52)
                            }
                            
                            TextAnimatableValue(value: scoreP1, strokeColor: Color.customTeal2, fontSize: 64.0, fontWeight: .black, strokeWidth: 4.0)
                        }
                    }
                    .opacity(opacityP1)
                }
            }
            
        }
        .onAppear() {
            // P1 animation 2.0s (0.5s delay + 1.5s animation)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    opacityP1 = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(Animation.easeIn(duration: 1)) {
                        scoreP1 = playViewModel.results[0].score
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                playViewModel.calculateWinner()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isTappable = true
                }
            }
            
        }
        .onTapGesture {
            if isTappable {
                playViewModel.isShowingWinner = true
            }
        }
    }
}

#Preview {
    ResultOneView()
}
