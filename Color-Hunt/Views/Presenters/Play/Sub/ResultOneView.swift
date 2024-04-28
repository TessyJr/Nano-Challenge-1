import SwiftUI

struct ResultOneView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    // Environment variable to manage presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image("backgroundTeal")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 16) {
                    HStack {
                        Image(uiImage: playViewModel.results[0].image)
                            .resizable()
                            .frame(width: 128, height: 128)
                            .scaledToFit()
                            .cornerRadius(16)
                        
                        Image(systemName: "arrowshape.right.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundColor(Color.customTeal)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(playViewModel.results[0].averageColor)
                            .frame(width: 128, height: 128)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24)
                    
                    ZStack {
                        Image("result1PlayerTeal")
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(playViewModel.results[0].targetColor)
                            .frame(width: 64, height: 64)
                            .offset(x: 85, y: -57)
                        
                    }
                    
                    Text(String(format: "%.2f", playViewModel.results[0].deltaE))
                        .foregroundColor(Color.white)
                        .font(.system(size: 64))
                        .fontWeight(.black)
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "house.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .padding(.horizontal, 128)
                        .padding(.vertical, 16)
                        .foregroundColor(Color.customTeal)
                        .background(Color.white)
                        .cornerRadius(16)
                }
            }
        }
    }
}

#Preview {
    ResultOneView()
}
