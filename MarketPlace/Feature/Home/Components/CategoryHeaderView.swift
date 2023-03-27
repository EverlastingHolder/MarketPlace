import SwiftUI

struct CategoryHeaderView: View {
    let model: CategoryHeaderModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 11) {
            Image(model.image)
                .backgroundCircle(color: Color("TextFieldBackground"), w: 42, h: 38)
            Text(model.title)
                .customFont(fontSize: 8, fontWeight: .medium)
                .foregroundColor(Color("TextHeaderColor"))
        }
    }
}
