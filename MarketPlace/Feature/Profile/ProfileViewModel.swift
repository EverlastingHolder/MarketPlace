import SwiftUI
import PhotosUI
import Combine

extension ProfileView {
    @MainActor
    class ViewModel: ObservableObject {
        let mockData: [ProfileCellModel] = [
            .init(id: 1, image: "Credit", title: "Trade store", style: .isNavigation),
            .init(id: 2, image: "Credit", title: "Payment method", style: .isNavigation),
            .init(id: 3, image: "Credit", title: "Balance", style: .isText("1593")),
            .init(id: 4, image: "Credit", title: "Trade history", style: .isNavigation),
            .init(id: 5, image: "Recycle", title: "Restore Purchase", style: .isNavigation),
            .init(id: 6, image: "Help", title: "Help", style: .empty),
        ]
        
        @Published
        var selectedItem: PhotosPickerItem? = nil
        @Published
        var selectedImage: Image? = nil
        @Published
        var isPresented: Bool = false
        
        private var bag = Set<AnyCancellable>()
        weak private var tabViewModel: AppTabBarView.ViewModel?
        weak private var appViewModel: MarketPlaceApp.ViewModel?
        
        init(tabViewModel: AppTabBarView.ViewModel?, appViewModel: MarketPlaceApp.ViewModel?) {
            self.tabViewModel =  tabViewModel
            self.appViewModel = appViewModel
            selectedPhoto()
        }
        
        func selectedPhoto() {
            $selectedItem
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .sink { [weak self] newValue in
                    Task {
                        if let imageData = try? await newValue?.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                            self?.selectedImage = Image(uiImage: image)
                        }
                    }
                }
                .store(in: &bag)
        }
        
        func back() {
            tabViewModel?.tabSelection = .home
        }
        
        func logOut() {
            appViewModel?.state = .signIn
        }
        
        deinit {
            bag.forEach { $0.cancel() }
            bag.removeAll()
            appViewModel = nil
            tabViewModel = nil
            print("deinit profile")
        }
    }
}
