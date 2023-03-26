import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("Menu")
                Spacer()
                HStack(spacing: 0) {
                    Text("Trade by ")
                    Text("bata").foregroundColor(Color("ButtonBackground"))
                }
                .customFont(fontSize: 20, fontWeight: .bold)
                    
                Spacer()
                VStack {
                    Image("ProfileImage")
                        .resizable()
                        .frame(maxWidth: 30, maxHeight: 32)
                        .overlay(Circle().stroke(Color("StrokeColor"), lineWidth: 1))
                    HStack(spacing: 0) {
                        Text("Location ")
                            .foregroundColor(Color("TextColor"))
                            .customFont(fontSize: 10, fontWeight: .regular)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(maxWidth: 6, maxHeight: 3)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 37)
            
//            CustomTextField
            Spacer()
        }
    }
}
