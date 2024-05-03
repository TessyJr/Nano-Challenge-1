import SwiftUI

struct PlayerTurnView: View {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @StateObject var camera = CameraModel()
    
    var body: some View {
        ZStack {
            Image("backgroundBlue")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                // Timer
                VStack(spacing: 8) {
                    VStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 28)
                    
                    Text(playViewModel.timeString(playViewModel.remainingTime))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundColor(Color.white)
                
                // Camera Preview
                ZStack{
                    // Black background
                    if playViewModel.selectedImage == nil {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 311, height: 311)
                            .cornerRadius(16)
                    } else {
                        Rectangle()
                            .fill(Color(playViewModel.uicAverageColor))
                            .frame(width: 311, height: 311)
                            .cornerRadius(16)
                    }
                
                    // Show camera preview
                    if !camera.isTaken {
                        CameraPreview(camera: camera, playViewModel: playViewModel)
                            .frame(width: 300, height: 300)
                            .cornerRadius(12)
                    } else {
                        // Show captured Image
                        if let image = camera.capturedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .cornerRadius(12)
                        }
                    }
                }
                
                // Target Color
                ZStack {
                    Image("targetPlayer\(playViewModel.currentPlayer)")
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black)
                            .frame(width: 68, height: 68)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(playViewModel.uicTargetColor))
                            .frame(width: 60, height: 60)
                            .cornerRadius(16)
                    }
                    .offset(x: 76, y: -52)
                    
                }
                
                // Camera Controls
                HStack {
                    if camera.isTaken && playViewModel.uicAverageColor != UIColor.clear {
                        // Average color
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black)
                                .frame(width: 60, height: 60)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(playViewModel.uicAverageColor))
                                .frame(width: 54, height: 54)
                        }
                        
                        Spacer()
                        
                        // Save picture
                        Button(action: {
                            playViewModel.saveImage()
                        }, label: {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 72, height: 72)
                        })
                        
                        Spacer()
                        
                        // Retake picture
                        Button(action: {
                            camera.reTake()
                            camera.isTaken = false
                        }, label: {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                        })
                    }
                    else {
                        // Take picture
                        Button(action: {
                            camera.takePic()
                        }, label: {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .frame(width: 72, height: 72)
                        })
                        .disabled(camera.isTaken)
                    }
                }
                .foregroundColor(Color.white)
                .frame(width: 311)
                .padding(.top, 16)
            }
            .padding()
        }
        .onAppear() {
            camera.checkAuthorization()
            camera.playViewModel = playViewModel
            
            playViewModel.startTimer()
        }
    }
}

#Preview {
    PlayerTurnView()
}
