import SwiftUI

struct ResultOneView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
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
                            
                            TextStroke(text: String(format: "%.2f%%", playViewModel.results[0].score), width: 4, color: Color.customTeal2)
                                .foregroundColor(Color.white)
                                .font(.system(size: 64))
                                .fontWeight(.black)
                            
//                            Text(String(format: "%.2f%%", playViewModel.results[0].score))
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 64))
//                                .fontWeight(.black)
                        }
                    }
                }
            }
            
        }
        .onAppear() {
            playViewModel.calculateWinner()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                playViewModel.isShowingWinner = true
            }
        }
    }
}

#Preview {
    ResultOneView()
}
