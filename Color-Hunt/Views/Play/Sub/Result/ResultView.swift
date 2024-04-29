import SwiftUI

struct ResultView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(playViewModel.results) { result in
                    VStack {
                        HStack {
                            Text("Player \(result.playerNumber)")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Target: ")
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(result.targetColor)
                                .overlay(
                                    Circle()
                                        .stroke(Color.primary, lineWidth: 2)
                                )
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Result: ")
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(result.averageColor)
                                .overlay(
                                    Circle()
                                        .stroke(Color.primary, lineWidth: 2)
                                )
                            
                            Spacer()
                        }
                        
                        Text("\(result.score)")
                        
                        Image(uiImage: result.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 256)
                    }
                    .padding(.bottom, 32)
                }
                
                
                
                Spacer()
            }
            
            Spacer()
            
            Button(action: {
                playViewModel.calculateWinner()
            }) {
                Image(systemName: "arrowshape.right.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.horizontal, 128)
                    .padding(.vertical, 16)
                    .foregroundColor(Color.customTeal)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        }
        .padding()
    }
}

#Preview {
    ResultView()
}
