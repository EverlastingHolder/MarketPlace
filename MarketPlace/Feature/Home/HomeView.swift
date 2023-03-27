import SwiftUI

struct HomeView: View {
    @StateObject
    private var viewModel: Self.ViewModel = .init()
    
    @FocusState
    private var isSearching: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: !viewModel.searchModel.words.isEmpty ? .leading : .center, spacing: 0) {
                HStack {
                    CustomTextField(text: $viewModel.search, placeholder: "What are you looking for ?", isTextField: .search)
                        .focused($isSearching)
                        .animation(.default, value: isSearching)
                    ZStack {
                        if isSearching {
                            Button(action: {
                                viewModel.search = ""
                                isSearching = false
                            }) {
                                Text("Cancel")
                            }
                            .transition(.move(edge: .trailing))
                        }
                    }
                    .animation(.default, value: isSearching)
                }
                .padding(.horizontal, 56)
                .padding(.top, 9)
                
                LazyVStack(alignment: !viewModel.searchModel.words.isEmpty ? .leading : .center) {
                    if !viewModel.searchModel.words.isEmpty {
                        ForEach (viewModel.searchModel.words, id: \.self) { item in
                            Button(action: {
                                viewModel.search = item
                            }) {
                                textRedSpecialCharacters(input: item)
                            }
                            .padding(.horizontal, 56)
                            .padding(.leading, 15)
                            .padding(.top, 9)
                        }
                    }
                    else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 21) {
                                ForEach(viewModel.model, id: \.self) { item in
                                    CategoryHeaderView(model: item)
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, 17)
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .padding(.top, 50)
                        } else {
                            HeaderView(title: "Latest")
                                .padding(.top, 30)
                                .padding(.bottom, 14)
                            
                            scrollViewContent {
                                ForEach(viewModel.latestModel.latest, id: \.self) { item in
                                    LatestView(model: item)
                                }
                            }
                            
                            HeaderView(title: "Flash Sale")
                                .padding(.top, 17)
                                .padding(.bottom, 8)
                            
                            scrollViewContent {
                                ForEach(viewModel.flashSaleModel.flash_sale, id: \.self) { item in
                                    FlashSaleView(model: item)
                                }
                            }
                            
                            HeaderView(title: "Brands")
                                .padding(.top, 17)
                                .padding(.bottom, 8)
                            
                            scrollViewContent {
                                ForEach(0...2, id: \.self) { _ in
                                    RoundedRectangle(cornerRadius: 9)
                                        .foregroundColor(.gray)
                                        .frame(width: 175, height: 220)
                                }
                            }
                        }
                    }
                }
                .animation(.default, value: viewModel.searchModel.words.isEmpty)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0) {
                        Text("Trade by ")
                        Text("bata").foregroundColor(Color("ButtonBackground"))
                    }
                    .customFont(fontSize: 20, fontWeight: .bold)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Image("Menu")
                }
                ToolbarItem {
                    VStack(spacing: 0) {
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
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func scrollViewContent<Content: View> (
        @ViewBuilder content: () -> Content
    ) -> some View {
        ScrollView(.horizontal) {
            LazyHStack {
                content()
            }
            .padding(.horizontal, 11)
        }
    }
    
    @ViewBuilder
    private func textRedSpecialCharacters(input: String) -> some View {
        HStack(spacing: 0) {
            ForEach(0..<input.count, id: \.self) { index in
                let char = String(input[input.index(input.startIndex, offsetBy: index)])
                if viewModel.search.contains(char) {
                    Text(char)
                        .foregroundColor(.blue)
                } else {
                    Text(char)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
