import Foundation

struct FlashSaleModel: Codable, Hashable {
    var flash_sale: [FlashSaleInfo]
    
    struct FlashSaleInfo: Codable, Hashable {
        var category: String
        var name: String
        var price: Double
        var discount: Int
        var image_url: String
        var imageUrl: URL { URL(string: image_url)! }
    }
}
