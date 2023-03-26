import Foundation
import Combine
import SwiftUI

extension LoginView {
    class ViewModel: ObservableObject {
        @Published
        var password: String = ""
        @Published
        var email: String = ""
        
        private let storage = SecureStorage()
        private var userModel = [UsersModel]()
        private var bag = Set<AnyCancellable>()
        private let container = LoginDataController.shared.container
        weak private var appViewModel: MarketPlaceApp.ViewModel?
        
        init(appViewModel: MarketPlaceApp.ViewModel) {
            self.appViewModel =  appViewModel
            loadCachedData()
        }
        
        private func loadCachedData() {
            CDPublisher(request: Users.fetchRequest(), context: container.viewContext)
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .map { users in
                    users.map { user in
                        UsersModel(
                            lastName: user.lastName,
                            firstName: user.firstName,
                            email: user.email
                        )
                    }
                }
                .sink(receiveCompletion: { _ in }) { [weak self] users in
                    self?.userModel = users
                }
                .store(in: &bag)
        }
        
        func checkPassword() {
            guard let user = userModel.first(where: { $0.email == email }) else {
                errorMessage(error: "Not found user")
                return
            }
            guard let pass = storage.getPassword(for: user.email!) else {
                errorMessage(error: "Not found password")
                return
            }
            if pass != password {
                errorMessage(error: "Not found password")
                return
            }
            appViewModel?.state = .home
        }
        
        private func errorMessage(error: String) {
            appViewModel?.alertMessage = error
            appViewModel?.isPresented = true
        }
        
        deinit {
            bag.forEach { $0.cancel() }
            bag.removeAll()
            appViewModel = nil
            print("deinit login ")
        }
    }
}
