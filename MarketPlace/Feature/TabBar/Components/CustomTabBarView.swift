import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding  var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBar
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

extension CustomTabBarView {
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(tab.iconName)
                .renderingMode(.template)
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10, corners: [.topLeft, .topRight])
    }
}

