import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject
    var viewModel: Self.ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    HStack {
                        Image("ArrowLeft")
                            .padding(.leading, 15)
                            .onTapGesture {
                                viewModel.back()
                            }
                        
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        Text("Profile")
                            .customFont(fontSize: 15, fontWeight: .bold)
                        VStack(spacing: 6) {
                            if let image = viewModel.selectedImage {
                                image
                                    .resizable()
                                    .frame(maxWidth: 61, maxHeight: 61)
                                    .clipShape(Circle())
                                    
                            } else {
                                Image("ProfileImage")
                            }
                            Button(action: {
                                viewModel.isPresented = true
                            }) {
                                Text("Change photo")
                                    .customFont(fontSize: 8, fontWeight: .medium)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 18)
                        Text("Satria Adhi Pradana")
                            .customFont(fontSize: 15, fontWeight: .bold)
                        
                        Button(action: {}) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Spacer()
                                    Image("share")
                                    Spacer()
                                    Text("Upload item")
                                        .customFont(fontSize: 14, fontWeight: .semibold)
                                    Spacer()
                                    Text("")
                                    Spacer()
                                }
                            }
                            .foregroundColor(.white)
                        }
                        .frame(height: 40)
                        .background(Color("ButtonBackground"))
                        .cornerRadius(15)
                        .padding(.horizontal, 43)
                        .padding(.top, 30)
                        
                        VStack(spacing: 25) {
                            ForEach(viewModel.mockData, id: \.id) { item in
                                ProfileCellView(model: item)
                            }
                            ProfileCellView(model:
                                    .init(
                                        id: 7,
                                        image: "LogOut",
                                        title: "Log Out",
                                        style: .action({ viewModel.logOut() })
                                    )
                            )
                        }
                        .padding(.leading, 32)
                        .padding(.trailing, 45)
                        .padding(.top, 14)
                        
                    }
                    .photosPicker(isPresented: $viewModel.isPresented, selection: $viewModel.selectedItem)
                                
                }
                Spacer()
            }
            .padding(.top, 8)
        }
    }
}





