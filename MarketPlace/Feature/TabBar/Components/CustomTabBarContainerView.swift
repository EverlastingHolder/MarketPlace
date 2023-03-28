import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    @Binding
    var selection: TabBarItem
    @State
    private var tabs: [TabBarItem] = []
    let content: Content
    
    init(
        selection: Binding<TabBarItem>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .padding(.bottom, 52)
                
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
        .padding(.bottom, 0.1)
    }
}
