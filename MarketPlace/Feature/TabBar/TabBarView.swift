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
            
            Text("Hello world")
                .tabBarItem(tab: .favorites, selection: $viewModel.tabSelection)
            
            Text("Hello world")
                .tabBarItem(tab: .cart, selection: $viewModel.tabSelection)
            
            Text("Hello world")
                .tabBarItem(tab: .messages, selection: $viewModel.tabSelection)
            
            ProfileView(viewModel: .init(tabViewModel: viewModel, appViewModel: viewModel.appViewModel))
                .tabBarItem(tab: .profile, selection: $viewModel.tabSelection)
        }
    }
}





