import SwiftUI

struct ResultThreeView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var winner = 0
    @State var opacityP1 = 1.0
    @State var opacityP2 = 1.0
    @State var opacityP3 = 1.0
    
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
                            Image(uiImage: playViewModel.results[0].image)
                                .resizable()
                                .frame(width: 48, height: 48)
                                .scaledToFit()
                                .cornerRadius(8)
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customTeal)
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(playViewModel.results[0].averageColor)
                                .frame(width: 48, height: 48)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 152)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(playViewModel.results[0].targetColor)
                                .frame(width: 28, height: 28)
                                .offset(x: 38, y: -26)
                        }
                        
                        Text(String(format: "%.2f%%", playViewModel.results[0].score))
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
                            Image(uiImage: playViewModel.results[1].image)
                                .resizable()
                                .frame(width: 48, height: 48)
                                .scaledToFit()
                                .cornerRadius(8)
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customOrange)
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(playViewModel.results[1].averageColor)
                                .frame(width: 48, height: 48)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 152)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(playViewModel.results[1].targetColor)
                                .frame(width: 28, height: 28)
                                .offset(x: 38, y: -26)
                        }
                        
                        Text(String(format: "%.2f%%", playViewModel.results[1].score))
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
                            Image(uiImage: playViewModel.results[2].image)
                                .resizable()
                                .frame(width: 48, height: 48)
                                .scaledToFit()
                                .cornerRadius(8)
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.customPink)
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(playViewModel.results[2].averageColor)
                                .frame(width: 48, height: 48)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                        ZStack {
                            Image("targetPlayer3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 152)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(playViewModel.results[2].targetColor)
                                .frame(width: 28, height: 28)
                                .offset(x: 38, y: -26)
                        }
                        
                        Text(String(format: "%.2f%%", playViewModel.results[2].score))
                            .foregroundColor(Color.white)
                            .font(.system(size: 36))
                            .fontWeight(.black)
                    }
                }
                
                ZStack {
                    Image("backgroundBlack")
                        .resizable()
                        .ignoresSafeArea()
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
                case 2:
                    opacityP1 = 0
                    opacityP3 = 0
                case 3:
                    opacityP1 = 0
                    opacityP2 = 0
                default:
                    opacityP1 = 0
                    opacityP2 = 0
                    opacityP3 = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    playViewModel.isShowingWinner = true
                }
            }
        }
    }
}

#Preview {
    ResultThreeView()
}
