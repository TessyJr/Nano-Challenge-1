import Foundation
import SwiftUI
import ColorKit

class PlayViewModel: ObservableObject {
    // Variable to store the result
    @Published var results: [Result] = []
    @Published var winner: Result?
    
    // Variables to show current player and number of players
    @Published var playerNumber: Int = 0
    @Published var currentPlayer: Int = 1
    
    // Variables to change views
    @Published var isGameOver: Bool = false
    @Published var isSelectingPlayerNumber: Bool = false
    @Published var isPlayerTransition: Bool = false
    @Published var isShowingWinner: Bool = false
    
    // State variables to manage image selection and manipulation
    @Published var showCamera = false
    @Published var selectedImage: UIImage?
    @Published var image: UIImage?
    
    // State variables for target color and average color calculation
    @Published var uicTargetColor: UIColor = UIColor.randomSolidColor()
    @Published var uicAverageColor: UIColor = UIColor.clear
    @Published var deltaE: CGFloat = 0
    
    func saveImage() {
        results.append(Result(playerNumber: currentPlayer, image: selectedImage!, targetColor: Color(uiColor: uicTargetColor), averageColor: Color(uiColor: uicAverageColor), deltaE: deltaE))
        
        if currentPlayer == playerNumber {
            isGameOver = true
        } else {
            currentPlayer += 1
            selectedImage = nil
            image = nil
            uicTargetColor = UIColor.randomSolidColor()
            uicAverageColor = UIColor.clear
            isPlayerTransition = true
        }
    }
    
    func calcDeltaECIE94(lhs: UIColor, rhs: UIColor) -> CGFloat {
        let kL: CGFloat = 1.0
        let kC: CGFloat = 1.0
        let kH: CGFloat = 1.0
        let k1: CGFloat = 0.045
        let k2: CGFloat = 0.015
        let sL: CGFloat = 1.0
        
        let c1 = sqrt(pow(lhs.a, 2) + pow(rhs.b, 2))
        let sC = 1 + k1 * c1
        let sH = 1 + k2 * c1
        
        let deltaL = lhs.L - rhs.L
        let deltaA = lhs.a - rhs.a
        let deltaB = lhs.b - rhs.b
                
        let c2 = sqrt(pow(rhs.a, 2) + pow(rhs.b, 2))
        let deltaCab = c1 - c2

        let deltaHab = sqrt(pow(deltaA, 2) + pow(deltaB, 2) - pow(deltaCab, 2))
        
        let p1 = pow(deltaL / (kL * sL), 2)
        let p2 = pow(deltaCab / (kC * sC), 2)
        let p3 = pow(deltaHab / (kH * sH), 2)
        
        let deltaE = sqrt(p1 + p2 + p3)
        
        let result = ((deltaE * 100).rounded(.toNearestOrEven)) / 100
        
        return result;
    }
    
    func calculateImageAverageColor() {
        if (selectedImage != nil) {
            do {
                // Calculate average color image
                uicAverageColor = try selectedImage!.averageColor()
                
                // Calculate delta of average color to target color
                deltaE = calcDeltaECIE94(lhs: uicAverageColor, rhs: uicTargetColor)
            } catch {
                print("Error while getting average color: \(error)")
            }
        }
    }
    
    func calculateWinner() -> Void {
        winner = results.max(by: { $0.score < $1.score })
        isShowingWinner = true
        return
    }
    
    func resetGame() {
        results = []
        winner = nil
        
        playerNumber = 0
        currentPlayer = 1
        
        isGameOver = false
        isSelectingPlayerNumber = false
        isPlayerTransition = false
        isShowingWinner = false
        
        showCamera = false
        selectedImage = nil
        image = nil
        
        uicTargetColor = UIColor.randomSolidColor()
        uicAverageColor = UIColor.clear
        deltaE = 0
    }
}

extension UIColor {
    static func randomSolidColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
