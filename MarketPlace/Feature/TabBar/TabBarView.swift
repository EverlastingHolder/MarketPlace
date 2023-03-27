import SwiftUI

struct AppTabBarView: View {
    @StateObject
    var viewModel: Self.ViewModel
    
    var body: some View {
        CustomTabBarContainerView(selection: $viewModel.tabSelection) {
            NavigationStack {
                HomeView()
            }
            .tabBarItem(tab: .home, selection: $viewModel.tabSelection)
            
            Color.red
                .tabBarItem(tab: .favorites, selection: $viewModel.tabSelection)
            
            Color.green
                .tabBarItem(tab: .cart, selection: $viewModel.tabSelection)
            
            Color.orange
                .tabBarItem(tab: .messages, selection: $viewModel.tabSelection)
            
            ProfileView(viewModel: .init(tabViewModel: viewModel, appViewModel: viewModel.appViewModel))
                .tabBarItem(tab: .profile, selection: $viewModel.tabSelection)
        }
    }
}





