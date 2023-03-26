import SwiftUI

extension AppTabBarView {
    class ViewModel: ObservableObject {
        @AppStorage("StateTabBar")
        var tabSelection: TabBarItem = .home
        
        weak var appViewModel: MarketPlaceApp.ViewModel?
        
        init(appViewModel: MarketPlaceApp.ViewModel) {
            self.appViewModel =  appViewModel
        }
    }
}

