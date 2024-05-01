import SwiftUI

struct TextStroke: View {
    let text: String
    let width: Double
    let color: Color
    
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
                Text(text).offset(x:  width)
                Text(text).offset(x:  -width)
                Text(text).offset(y: width)
                Text(text).offset(y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
