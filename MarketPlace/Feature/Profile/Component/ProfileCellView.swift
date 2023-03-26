import SwiftUI

struct ProfileCellView: View {
    let model: ProfileCellModel
    
    var body: some View {
        HStack {
            switch model.style {
            case.empty:
                defaultView {
                    EmptyView()
                }
            case .isNavigation:
                defaultView {
                    Image("ArrowRight")
                }
            case .isText(let title):
                defaultView {
                    Text("$ \(title)")
                        .customFont(fontSize: 14, fontWeight: .medium)
                }

            case .action(let action):
                defaultView {
                    EmptyView()
                } action: {
                    action()
                }
            }
        }
    }
    
    private func defaultView<Content: View> (
        @ViewBuilder content: () -> Content,
        action: ( () -> Void)? = nil
    ) -> some View {
        HStack {
            Image(model.image)
                .padding(8)
                .background(Color("ImageBackground"))
                .clipShape(Circle())
                
            Text(model.title)
                .customFont(fontSize: 14, fontWeight: .medium)
            Spacer()
            content()
        }
        .onTapGesture {
            (action ?? {})()
        }
    }
}
