import Foundation

struct LatestModel: Codable, Hashable {
    var latest: [LatestInfo]
    
    struct LatestInfo: Codable, Hashable {
        var category: String
        var name: String
        var price: Int
        var image_url: String
        var imageUrl: URL { URL(string: image_url)! }
    }
}
