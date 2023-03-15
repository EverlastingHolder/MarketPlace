import SwiftUI

struct CustomFontModifier: ViewModifier {
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat", size: fontSize))
            .fontWeight(fontWeight)
    }
}
