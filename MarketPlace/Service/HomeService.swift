import Foundation
import Combine

protocol HomeServiceType {
    func getLatest() -> AnyPublisher<LatestModel, Error>
    func getFlashSale() -> AnyPublisher<FlashSaleModel, Error>
    func search() -> AnyPublisher<SearchModel, Error>
}

final class HomeService: HomeServiceType {
    private let baseNetwork: BaseNetwork = BaseNetwork()
    
    func getLatest() -> AnyPublisher<LatestModel, Error> {
        self.baseNetwork.run("cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")
    }
    
    func getFlashSale() -> AnyPublisher<FlashSaleModel, Error> {
        self.baseNetwork.run("a9ceeb6e-416d-4352-bde6-2203416576ac")
    }
    
    func search() -> AnyPublisher<SearchModel, Error> {
        self.baseNetwork.run("4c9cd822-9479-4509-803d-63197e5a9e19")
    }
}
