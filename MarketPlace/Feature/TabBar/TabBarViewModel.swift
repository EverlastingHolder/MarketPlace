import SwiftUI

extension AppTabBarView {
    class ViewModel: ObservableObject {
        @Published
        var tabSelection: TabBarItem = .home
        
        weak var appViewModel: MarketPlaceApp.ViewModel?
        
        init(appViewModel: MarketPlaceApp.ViewModel) {
            self.appViewModel =  appViewModel
        }
    }
}

