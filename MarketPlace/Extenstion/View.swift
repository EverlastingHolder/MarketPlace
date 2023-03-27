import SwiftUI

extension View {
    func customFont(fontSize: CGFloat, fontWeight: Font.Weight) -> some View {
        modifier(CustomFontModifier(fontSize: fontSize, fontWeight: fontWeight))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        self.modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
    
    func backgroundColor(edges: Edge.Set = [.horizontal, .top]) -> some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea(.container, edges: edges)
            self
        }
    }
    
    func backgroundCircle(color: Color, w: CGFloat, h: CGFloat) -> some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(color)
                .frame(width: w, height: h)
            self
        }
    }
}
