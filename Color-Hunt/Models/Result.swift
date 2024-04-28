import Foundation
import PhotosUI
import SwiftUI
import ColorKit

struct Result: Identifiable {
    var id: UUID
    var playerName: String
    var image: UIImage
    var targetColor: Color
    var averageColor: Color
//    var deltaE: UIColor.ColorDifferenceResult
    var deltaE: CGFloat
    
    init(playerName: String, image: UIImage, targetColor: Color, averageColor: Color, deltaE: CGFloat) {
        self.id = UUID()
        self.playerName = playerName
        self.image = image
        self.targetColor = targetColor
        self.averageColor = averageColor
        self.deltaE = deltaE
    }
}
