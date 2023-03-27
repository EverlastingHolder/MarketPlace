import SwiftUI
import NukeUI

struct LatestView: View {
    @State
    var model: LatestModel.LatestInfo
    
    var body: some View {
        ZStack {
            LazyImage(url: model.imageUrl) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 115, height: 150)
                        .cornerRadius(9)
                } else {
                    RoundedRectangle(cornerRadius: 9)
                        .foregroundColor(.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text(model.category)
                    .foregroundColor(.black)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(Color("TextFieldBackground"))
                    .cornerRadius(5)
                    .customFont(fontSize: 6, fontWeight: .semibold)
                    .padding(.bottom, 3)
                
                Text(model.name)
                    .frame(maxWidth: 90, alignment: .leading)
                    .foregroundColor(.white)
                    .customFont(fontSize: 9, fontWeight: .semibold)
                
                HStack {
                    Text("$ \(model.price)")
                        .foregroundColor(.white)
                        .customFont(fontSize: 7, fontWeight: .semibold)
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("ImageSelection"))
                        .frame(width: 13, height: 13)
                        .backgroundCircle(color: Color("TextFieldBackground"), w: 20, h: 20)
                }
                .padding(.top, 8)
            }
            .padding(.leading, 7)
            .padding([.trailing, .bottom], 5)
        }
        .frame(width: 115, height: 150)
    }
}

