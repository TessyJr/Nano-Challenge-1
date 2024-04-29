import SwiftUI

struct ResultTwoView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @State var winner = 0
    
    var body: some View {
        Grid(horizontalSpacing: 8, verticalSpacing: 8) {
            GridRow {
                ZStack {
                    if winner == 0 {
                        Image("backgroundTeal")
                            .resizable()
                            .ignoresSafeArea()
                    }else {
                        Image(winner == 1 ? "backgroundTeal" : "backgroundBlack")
                            .resizable()
                            .ignoresSafeArea()
                    }
                    
                    VStack(spacing: 12) {
                        HStack {
                            Image(uiImage: playViewModel.results[0].image)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .scaledToFit()
                                .cornerRadius(12)
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(Color.customTeal)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(playViewModel.results[0].averageColor)
                                .frame(width: 64, height: 64)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        
                        ZStack {
                            Image("resultPlayer1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 212)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(playViewModel.results[0].targetColor)
                                .frame(width: 48, height: 48)
                                .offset(x: 52, y: -35)
                        }
                        
                        Text(String(format: "%.2f%%", playViewModel.results[0].score))
                            .foregroundColor(Color.white)
                            .font(.system(size: 48))
                            .fontWeight(.black)
                    }
                }
            }
            
            GridRow {
                ZStack {
                    if winner == 0 {
                        Image("backgroundOrange")
                            .resizable()
                            .ignoresSafeArea()
                    }else {
                        Image(winner == 2 ? "backgroundOrange" : "backgroundBlack")
                            .resizable()
                            .ignoresSafeArea()
                    }
                    
                    VStack(spacing: 12) {
                        HStack {
                            Image(uiImage: playViewModel.results[1].image)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .scaledToFit()
                                .cornerRadius(12)
                            
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(Color.customOrange)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(playViewModel.results[1].averageColor)
                                .frame(width: 64, height: 64)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        
                        ZStack {
                            Image("resultPlayer2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 212)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(playViewModel.results[1].targetColor)
                                .frame(width: 48, height: 48)
                                .offset(x: 51, y: -35)
                        }
                        
                        Text(String(format: "%.2f%%", playViewModel.results[1].score))
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    playViewModel.isShowingWinner = true
                }
            }
        }
    }
}

#Preview {
    ResultTwoView()
}
