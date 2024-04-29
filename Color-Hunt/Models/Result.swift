import Foundation
import PhotosUI
import SwiftUI
import ColorKit

struct Result: Identifiable, Hashable {
    var id: UUID
    var playerNumber: Int
    var image: UIImage
    var targetColor: Color
    var averageColor: Color
    var deltaE: CGFloat
    var score: CGFloat = 0
    
    init(playerNumber: Int, image: UIImage, targetColor: Color, averageColor: Color, deltaE: CGFloat) {
        self.id = UUID()
        self.playerNumber = playerNumber
        self.image = image
        self.targetColor = targetColor
        self.averageColor = averageColor
        self.deltaE = deltaE
        
        if deltaE >= 100 {
            self.score = 0
        }else {
            self.score = 100 - deltaE
        }
    }
}
