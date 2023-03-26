import SwiftUI

enum TabBarItem: Hashable {
    case home, favorites, cart, messages, profile
    
    var iconName: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorite"
        case .cart: return "Cart"
        case .messages: return "Message"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        Color("ImageSelection")
    }
}
