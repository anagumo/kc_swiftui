import SwiftUI

struct LoadingView: View {
    @State private var animation: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .frame(width: 20, height: 20)
                .foregroundStyle(.accent)
                .scaleEffect(animation)
                .animation(.easeIn(duration: 1).repeatForever(), value: animation)
            Text("Loading")
                .foregroundStyle(.marvelPrimaryText)
                .padding(.top, 20)
            Spacer()
        }
        .onAppear {
            animation = 2
        }
    }
}

#Preview {
    LoadingView()
}
