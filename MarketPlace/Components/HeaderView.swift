import SwiftUI

struct HeaderView: View {
    @State
    var title: String = ""
    
    var body: some View {
        HStack {
            Text(title)
                .customFont(fontSize: 15, fontWeight: .medium)
            Spacer()
            Text("View all")
                .customFont(fontSize: 9, fontWeight: .medium)
        }
        .padding(.horizontal, 11)
    }
}

