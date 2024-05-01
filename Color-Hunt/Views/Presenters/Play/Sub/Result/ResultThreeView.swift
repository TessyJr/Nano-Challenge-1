import SwiftUI

struct ResultThreeView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var winner: Int = 0
    @State var opacityBgP1: Double = 1.0
    @State var opacityBgP2: Double = 1.0
    @State var opacityBgP3: Double = 1.0
    @State var isTappable: Bool = false
    
    @State var scoreP1: Double = 0
    @State var opacityP1: Double = 0
    @State var scoreP2: Double = 0
    @State var opacityP2: Double = 0
    @State var scoreP3: Double = 0
    @State var opacityP3: Double = 0
    
    var body: some View {
        Grid(horizontalSpacing: 6, verticalSpacing: 6) {
            GridRow {
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundTeal")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityBgP1)
                    
                    VStack(alignment: .center, spacing: 12) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                Image(uiImage: playViewModel.results[0].image)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .scaledToFit()
                                    .cornerRadius(8)
                            }
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customTeal)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                if playViewModel.results[0].image == UIImage(named: "noPhoto") {
                                    Image("noPhoto")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .scaledToFit()
                                        .cornerRadius(8)
                                } else {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(playViewModel.results[0].averageColor)
                                        .frame(width: 48, height: 48)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.black)
                                    .frame(width: 32, height: 32)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(playViewModel.results[0].targetColor)
                                    .frame(width: 28, height: 28)
                            }
                            .offset(x: 39, y: -27)
                        }
                        
                        TextAnimatableValue(value: scoreP1, strokeColor: Color.customTeal2, fontSize: 32.0, fontWeight: .black, strokeWidth: 3.0)
                    }
                    .opacity(opacityP1)
                }
                
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundOrange")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityBgP2)
                    
                    VStack(alignment: .center, spacing: 12) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                Image(uiImage: playViewModel.results[1].image)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .scaledToFit()
                                    .cornerRadius(8)
                            }
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customOrange)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                if playViewModel.results[1].image == UIImage(named: "noPhoto") {
                                    Image("noPhoto")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .scaledToFit()
                                        .cornerRadius(8)
                                } else {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(playViewModel.results[1].averageColor)
                                        .frame(width: 48, height: 48)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.black)
                                    .frame(width: 32, height: 32)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(playViewModel.results[1].targetColor)
                                    .frame(width: 28, height: 28)
                            }
                            .offset(x: 39, y: -27)
                        }
                        
                        TextAnimatableValue(value: scoreP2, strokeColor: Color.customOrange2, fontSize: 32.0, fontWeight: .black, strokeWidth: 3.0)
                    }
                    .opacity(opacityP2)
                }
            }
            
            GridRow {
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundPink")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityBgP3)
                    
                    VStack(alignment: .center, spacing: 12) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                Image(uiImage: playViewModel.results[2].image)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .scaledToFit()
                                    .cornerRadius(8)
                            }
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customPink)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                if playViewModel.results[2].image == UIImage(named: "noPhoto") {
                                    Image("noPhoto")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .scaledToFit()
                                        .cornerRadius(8)
                                } else {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(playViewModel.results[2].averageColor)
                                        .frame(width: 48, height: 48)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.black)
                                    .frame(width: 32, height: 32)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(playViewModel.results[2].targetColor)
                                    .frame(width: 28, height: 28)
                            }
                            .offset(x: 39, y: -27)
                        }
                        
                        TextAnimatableValue(value: scoreP3, strokeColor: Color.customPink2, fontSize: 32.0, fontWeight: .black, strokeWidth: 3.0)
                    }
                    .opacity(opacityP3)
                }
                
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                }
            }
        }
        .onAppear() {
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
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    opacityP2 = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(Animation.easeIn(duration: 1)) {
                        scoreP2 = playViewModel.results[1].score
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    opacityP3 = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(Animation.easeIn(duration: 1)) {
                        scoreP3 = playViewModel.results[2].score
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                playViewModel.calculateWinner()
                winner = playViewModel.winner!.playerNumber
                
                withAnimation(Animation.easeIn(duration: 0.2)) {
                    switch winner {
                    case 1:
                        opacityBgP2 = 0
                        opacityBgP3 = 0
                    case 2:
                        opacityBgP1 = 0
                        opacityBgP3 = 0
                    case 3:
                        opacityBgP1 = 0
                        opacityBgP2 = 0
                    default:
                        opacityBgP1 = 0
                        opacityBgP2 = 0
                        opacityBgP3 = 0
                    }
                }
                
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
    ResultThreeView()
}
