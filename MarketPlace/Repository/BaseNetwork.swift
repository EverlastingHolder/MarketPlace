import Foundation
import SwiftUI
import Combine

final class BaseNetwork {
    private let baseURL: URL = URL(string:"https://run.mocky.io/v3/")!
    private let session: URLSession = .shared
    
    func run<T: Codable>(
        _ path: String,
        method: String = "GET",
        params: [String: String?] = [:],
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, Error> {
        let request = URLRequest.init(
            baseURL.appendingPathComponent(path),
            method: method
        )
        
        return self.request(request)
    }
    
    private func request<T: Codable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return session
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .subscribe(on: Scheduler.background)
            .receive(on: Scheduler.main)
            .eraseToAnyPublisher()
    }
}
