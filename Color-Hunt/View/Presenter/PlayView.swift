import SwiftUI
import PhotosUI
import ColorKit

// Main view for playing with images
struct PlayView: View {
    // Observable object to for view model
    @ObservedObject var viewModel: PlayViewModel = PlayViewModel()
    
    // Environment variable to manage presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    // Variables to show current player and number of players
    let playerNumber: Int
    @State private var currentPlayer: Int = 1
    @State private var isGameOver: Bool = false
    
    // State variables to manage image selection and manipulation
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var image: UIImage?
    
    // State variables for target color and average color calculation
    @State private var targetColor: Color = Color(uiColor: UIColor.random())
    
    @State private var averageColor: Color?
    @State var deltaE: UIColor.ColorDifferenceResult?
    
    var body: some View {
        VStack {
            Text("Player \(currentPlayer)")
                .font(.title2)
                .fontWeight(.bold)
            
            // Display selected image and its average color
            if let selectedImage{
                VStack {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundColor(averageColor)
                            .overlay(
                                Circle()
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                    }
                    
                    Text("Delta E = \(deltaE)")
                }
            }
            Spacer()
            
            // Controls for target color selection, camera, and image submission
            ZStack{
                // Target color display
                HStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(targetColor)
                        .overlay(
                            Circle()
                                .stroke(Color.primary, lineWidth: 2)
                        )
                    
                    Spacer()
                }
                
                // Button to open camera
                HStack{
                    Button(action: {
                        self.showCamera.toggle()
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
                if selectedImage != nil {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // Insert image to array
                            viewModel.results.append(Result(playerName: "Player \(currentPlayer)", image: selectedImage!))
                            
                            if currentPlayer == playerNumber {
                                isGameOver = true
                            } else {
                                self.currentPlayer += 1
                                self.selectedImage = nil
                                self.image = nil
                                self.targetColor = Color(uiColor: UIColor.random())
                                self.averageColor = nil
                            }
                            
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
        .fullScreenCover(isPresented: self.$showCamera) {
            AccessCameraView(selectedImage: self.$selectedImage)
                .onDisappear(){
                    // Calculate average color when camera view disappears
                    if selectedImage != nil {
                        do {
                            averageColor = Color(try selectedImage!.averageColor())
                            
                            let uiAverageColor = UIColor(averageColor!)
                            
                            deltaE = uiAverageColor.difference(from: UIColor(targetColor), using: .CIE94)
                            
                            print(deltaE!)
                        } catch {
                            print("Error while getting average color: \(error)")
                        }
                    }
                }
        }
        .fullScreenCover(isPresented: self.$isGameOver) {
            VStack {
                ForEach(viewModel.results) { result in
                    VStack{
                        Text("\(result.playerName)")
                        Image(uiImage: result.image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                Spacer()
            }
            .onAppear() {
                print(viewModel.results)
            }
            .padding()
        }
    }
}

#Preview {
    PlayView(playerNumber: 4)
}
