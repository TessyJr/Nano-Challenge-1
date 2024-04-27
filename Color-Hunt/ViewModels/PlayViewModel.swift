import Foundation
import SwiftUI
import ColorKit

class PlayViewModel: ObservableObject {
    // Variable to store the result
    @Published var results: [Result] = []
    
    // Variables to show current player and number of players
    @Published var playerNumber: Int = 0
    @Published var currentPlayer: Int = 1
    
    // Variables to change views
    @Published var isGameOver: Bool = false
    @Published var isSelectingPlayerNumber: Bool = true
    @Published var isPlayerTransition: Bool = false
    
    // State variables to manage image selection and manipulation
    @Published var showCamera = false
    @Published var selectedImage: UIImage?
    @Published var image: UIImage?
    
    // State variables for target color and average color calculation
    @Published var uicTargetColor: UIColor = UIColor.random()
    @Published var uicAverageColor: UIColor = UIColor.clear
    @Published var deltaE: UIColor.ColorDifferenceResult?
    
    func saveImage() {
        results.append(Result(playerName: "Player \(currentPlayer)", image: selectedImage!, targetColor: Color(uiColor: uicTargetColor), averageColor: Color(uiColor: uicAverageColor), deltaE: deltaE!))
        
        if currentPlayer == playerNumber {
            isGameOver = true
        } else {
            currentPlayer += 1
            selectedImage = nil
            image = nil
            uicTargetColor = UIColor.random()
            uicAverageColor = UIColor.clear
            isPlayerTransition = true
        }
    }
    
    func calculateImageAverageColor() {
        if (selectedImage != nil) {
            do {
                // Calculate average color image
                uicAverageColor = try selectedImage!.averageColor()
                
                // Calculate delta of average color to target color
                deltaE = uicAverageColor.difference(from: uicTargetColor, using: .CIE94)
            } catch {
                print("Error while getting average color: \(error)")
            }
        }
    }
    
    func resetGame() {
        results = []
        
        playerNumber = 0
        currentPlayer = 1
        
        isGameOver = false
        isSelectingPlayerNumber = true
        isPlayerTransition = false
        
        selectedImage = nil
        image = nil
        
        uicTargetColor = UIColor.random()
        uicAverageColor = UIColor.clear
        deltaE = nil
    }
}
