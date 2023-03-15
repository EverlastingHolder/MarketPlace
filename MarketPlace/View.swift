import SwiftUI

extension View {
    func customFont(fontSize: CGFloat, fontWeight: Font.Weight) -> some View {
        modifier(CustomFontModifier(fontSize: fontSize, fontWeight: fontWeight))
    }
}
