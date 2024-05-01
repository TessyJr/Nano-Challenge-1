import SwiftUI

struct ResultTwoView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var winner: Int = 0
    @State var opacityP1: Double = 1.0
    @State var opacityP2: Double = 1.0
    @State var isTappable: Bool = false
    
    var body: some View {
        Grid(horizontalSpacing: 8, verticalSpacing: 8) {
            GridRow {
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundTeal")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityP1)
                        .animation(.easeIn(duration: 0.2), value: opacityP1)
                    
                    VStack(spacing: 12) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black)
                                    .frame(width: 70, height: 70)
                                
                                Image(uiImage: playViewModel.results[0].image)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                    .scaledToFit()
                                    .cornerRadius(12)
                            }
                            
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(Color.customTeal)
                            
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black)
                                    .frame(width: 70, height: 70)
                                
                                if playViewModel.results[0].image == UIImage(named: "noPhoto") {
                                    Image("noPhoto")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .scaledToFit()
                                        .cornerRadius(12)
                                } else {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(playViewModel.results[0].averageColor)
                                        .frame(width: 64, height: 64)
                                }
                            }
                            
                        }
                        .padding(13)
                        .background(Color.white)
                        .cornerRadius(20)
                        
                        ZStack {
                            Image("targetPlayer1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 212)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 46, height: 46)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(playViewModel.results[0].targetColor)
                                    .frame(width: 40, height: 40)
                            }
                            .offset(x: 52.5, y: -35.5)
                        }
                        
                        TextStroke(text: String(format: "%.2f%%", playViewModel.results[0].score), width: 4, color: Color.customTeal2)
                            .foregroundColor(Color.white)
                            .font(.system(size: 48))
                            .fontWeight(.black)
                    }
                }
            }
            
            GridRow {
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundOrange")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityP2)
                        .animation(.easeIn(duration: 0.25), value: opacityP2)
                    
                    VStack(spacing: 12) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black)
                                    .frame(width: 70, height: 70)
                                
                                Image(uiImage: playViewModel.results[1].image)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                    .scaledToFit()
                                    .cornerRadius(12)
                            }
                            
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(Color.customOrange)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black)
                                    .frame(width: 70, height: 70)
                                
                                if playViewModel.results[1].image == UIImage(named: "noPhoto") {
                                    Image("noPhoto")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .scaledToFit()
                                        .cornerRadius(12)
                                } else {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(playViewModel.results[1].averageColor)
                                        .frame(width: 64, height: 64)
                                }
                            }
                        }
                        .padding(13)
                        .background(Color.white)
                        .cornerRadius(20)
                        
                        ZStack {
                            Image("targetPlayer2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 212)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 46, height: 46)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(playViewModel.results[1].targetColor)
                                    .frame(width: 40, height: 40)
                            }
                            .offset(x: 52.5, y: -35.5)
                        }
                        
                        TextStroke(text: String(format: "%.2f%%", playViewModel.results[1].score), width: 4, color: Color.customOrange2)
                            .foregroundColor(Color.white)
                            .font(.system(size: 48))
                            .fontWeight(.black)
                    }
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                playViewModel.calculateWinner()
                winner = playViewModel.winner!.playerNumber
                
                switch winner {
                case 1:
                    opacityP2 = 0
                case 2:
                    opacityP1 = 0
                default:
                    opacityP1 = 0
                    opacityP2 = 0
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
    ResultTwoView()
}
