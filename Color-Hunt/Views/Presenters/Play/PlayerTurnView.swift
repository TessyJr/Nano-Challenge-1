import SwiftUI

struct PlayerTurnView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        VStack {
            Text("Player \(playViewModel.currentPlayer)")
                .font(.title2)
                .fontWeight(.bold)
            
            // Display selected image and its average color
            if playViewModel.selectedImage != nil {
                VStack {
                    Image(uiImage: playViewModel.selectedImage!)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundColor(Color(uiColor: playViewModel.uicAverageColor))
                            .overlay(
                                Circle()
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                    }
                    
                    Text("Delta E = \(String(describing: playViewModel.deltaE))")
                }
            }
            Spacer()
            
            // Controls for target color selection, camera, and image submission
            ZStack{
                // Target color display
                HStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color(uiColor: playViewModel.uicTargetColor))
                        .overlay(
                            Circle()
                                .stroke(Color.primary, lineWidth: 2)
                        )
                    
                    Spacer()
                }
                
                // Button to open camera
                HStack{
                    Button(action: {
                        playViewModel.showCamera.toggle()
                    }) {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 32)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
                }
                
                // Button to submit selected image
                if playViewModel.selectedImage != nil {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // Save image to array
                            playViewModel.saveImage()
                        }) {
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 32)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(16)
                        }
                    }
                }
            }
        }
        .padding()
        .fullScreenCover(isPresented: $playViewModel.showCamera) {
            AccessCameraView()
        }
    }
}

#Preview {
    PlayerTurnView()
}
