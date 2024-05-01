import SwiftUI

struct ResultFourView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var winner: Int = 0
    @State var opacityP1: Double = 1.0
    @State var opacityP2: Double = 1.0
    @State var opacityP3: Double = 1.0
    @State var opacityP4: Double = 1.0
    @State var isTappable: Bool = false
    
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
                        .opacity(opacityP1)
                        .animation(.easeIn(duration: 0.2), value: opacityP1)
                    
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
                        
                        TextStroke(text: String(format: "%.2f%%", playViewModel.results[0].score), width: 3, color: Color.customTeal2)
                            .foregroundColor(Color.white)
                            .font(.system(size: 36))
                            .fontWeight(.black)
                    }
                }
                
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundOrange")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityP2)
                        .animation(.easeIn(duration: 0.2), value: opacityP2)
                    
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
                        
                        TextStroke(text: String(format: "%.2f%%", playViewModel.results[1].score), width: 3, color: Color.customOrange2)
                            .foregroundColor(Color.white)
                            .font(.system(size: 36))
                            .fontWeight(.black)
                    }
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
                        .opacity(opacityP3)
                        .animation(.easeIn(duration: 0.2), value: opacityP3)
                    
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
                        
                        TextStroke(text: String(format: "%.2f%%", playViewModel.results[2].score), width: 3, color: Color.customPink2)
                            .foregroundColor(Color.white)
                            .font(.system(size: 36))
                            .fontWeight(.black)
                    }
                }
                
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("backgroundPurple")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(opacityP4)
                        .animation(.easeIn(duration: 0.2), value: opacityP4)
                    
                    VStack(alignment: .center, spacing: 12) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                Image(uiImage: playViewModel.results[3].image)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .scaledToFit()
                                    .cornerRadius(8)
                            }
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customPurple)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 52, height: 52)
                                
                                if playViewModel.results[3].image == UIImage(named: "noPhoto") {
                                    Image("noPhoto")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .scaledToFit()
                                        .cornerRadius(8)
                                } else {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(playViewModel.results[3].averageColor)
                                        .frame(width: 48, height: 48)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.black)
                                    .frame(width: 32, height: 32)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(playViewModel.results[3].targetColor)
                                    .frame(width: 28, height: 28)
                            }
                            .offset(x: 39, y: -27)
                        }
                        
                        TextStroke(text: String(format: "%.2f%%", playViewModel.results[3].score), width: 3, color: Color.customPurple2)
                            .foregroundColor(Color.white)
                            .font(.system(size: 36))
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
                    opacityP3 = 0
                    opacityP4 = 0
                case 2:
                    opacityP1 = 0
                    opacityP3 = 0
                    opacityP4 = 0
                case 3:
                    opacityP1 = 0
                    opacityP2 = 0
                    opacityP4 = 0
                case 4:
                    opacityP1 = 0
                    opacityP2 = 0
                    opacityP3 = 0
                default:
                    opacityP1 = 0
                    opacityP2 = 0
                    opacityP3 = 0
                    opacityP4 = 0
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
    ResultFourView()
}
