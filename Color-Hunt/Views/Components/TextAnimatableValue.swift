import SwiftUI

struct TextAnimatableValue: View, Animatable {
    var value: Double
    var strokeColor: Color
    var fontSize: Double
    var fontWeight: Font.Weight
    var strokeWidth: Double
    
    var animatableData: Double {
        get {
            value
        }
        set {
            value = newValue
        }
    }
    
    var body: some View {
        TextStroke(text: String(format: "%.2f%%", value), width: strokeWidth, color: strokeColor)
            .foregroundColor(Color.white)
            .font(.system(size: fontSize))
            .fontWeight(fontWeight)
    }
}
