import SwiftUI
import NukeUI

struct FlashSaleView: View {
    @State
    var model: FlashSaleModel.FlashSaleInfo
    
    var body: some View {
        ZStack {
            LazyImage(url: model.imageUrl) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 220)
                        .cornerRadius(9)
                } else {
                    RoundedRectangle(cornerRadius: 9)
                        .foregroundColor(.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    Image("ImageCard")
                    
                    Spacer()
                    
                    Text("\(model.discount)% off")
                        .foregroundColor(.white)
                        .padding(.horizontal, 7)
                        .padding(.vertical, 3)
                        .background(Color.red)
                        .cornerRadius(9)
                        .customFont(fontSize: 10, fontWeight: .semibold)
                        .padding(.bottom, 3)
                }
                Spacer()
                Text(model.category)
                    .foregroundColor(.black)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(Color("TextFieldBackground"))
                    .cornerRadius(9)
                    .customFont(fontSize: 9, fontWeight: .semibold)
                    .padding(.bottom, 3)
                
                Text(model.name)
                    .frame(maxWidth: 90, alignment: .leading)
                    .foregroundColor(.white)
                    .customFont(fontSize: 13, fontWeight: .semibold)
                
                HStack {
                    Text("$ \(model.price, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .customFont(fontSize: 10, fontWeight: .semibold)
                    Spacer()
                    Image("Favorite")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("ImageSelection"))
                        .frame(width: 12, height: 10)
                        .backgroundCircle(color: Color("TextFieldBackground"), w: 28, h: 28)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("ImageSelection"))
                        .frame(width: 13, height: 13)
                        .backgroundCircle(color: Color("TextFieldBackground"), w: 35, h: 35)
                }
                .padding(.top, 8)
            }
            .padding([.leading, .top], 7)
            .padding([.trailing, .bottom], 5)
        }.frame(width: 175, height: 220)
    }
}

