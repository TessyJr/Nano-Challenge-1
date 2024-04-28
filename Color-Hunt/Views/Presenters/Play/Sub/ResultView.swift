import SwiftUI

struct ResultView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    // Environment variable to manage presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(playViewModel.results) { result in
                    VStack {
                        HStack {
                            Text("\(result.playerName)")
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
                        
                        Text("\(result.deltaE)")
                        
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
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 256, height: 32)
            .padding(24)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(16)
        }
        .padding()
    }
}

#Preview {
    ResultView()
}
