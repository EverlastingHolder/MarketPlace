import Foundation
import Combine

extension HomeView {
    class ViewModel: ObservableObject {
        @Published
        var search: String = ""
        
        @Published
        var latestModel: LatestModel = .init(latest: [])
        
        @Published
        var flashSaleModel: FlashSaleModel = .init(flash_sale: [])
        
        @Published
        var isLoading: Bool = true
        
        @Published
        var searchModel: SearchModel = .init(words: [])
        
        private let service = HomeService()
        private var bag: Set<AnyCancellable> = .init()
        
        let model: [CategoryHeaderModel] = [
            .init(image: "Phone", title: "Phones"),
            .init(image: "Music", title: "Headphones"),
            .init(image: "Games", title: "Games"),
            .init(image: "Cars", title: "Cars"),
            .init(image: "Bed", title: "Furniture"),
            .init(image: "Robot", title: "kids")
        ]
        
        init() {
            getLatest()
            getFlashSale()
            
            $isLoading
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .sink { [weak self] _ in
                    if self?.latestModel.latest.isEmpty == true || self?.flashSaleModel.flash_sale.isEmpty == true {
                        self?.isLoading = true
                    } else {
                        self?.isLoading = false
                    }
                }
                .store(in: &bag)
            
            $search
                .debounce(for: .milliseconds(1000), scheduler: Scheduler.main)
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .sink { [weak self] result in
                    if !result.isEmpty {
                        self?.searchWords()
                    } else {
                        self?.searchModel.words = []
                    }
                }
                .store(in: &bag)
        }
        
        private func searchWords() {
            self.service.search()
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .sink(receiveCompletion: { _ in }) { [weak self] result in
                    self?.searchModel.words = result.words.filter { $0.contains(self?.search ?? "") }
                }
                .store(in: &bag)
        }

        private func getFlashSale() {
            self.service.getFlashSale()
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .sink(receiveCompletion: { _ in }) { [weak self] result in
                    self?.flashSaleModel = result
                }
                .store(in: &bag)
        }
        
        private func getLatest() {
            self.service.getLatest()
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .sink(receiveCompletion: { _ in }) { [weak self] result in
                    self?.latestModel = result
                }
                .store(in: &bag)
        }
        
        deinit {
            bag.forEach { $0.cancel() }
            bag.removeAll()
            print("deinit home")
        }
    }
}
