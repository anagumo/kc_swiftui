import SwiftUI

struct EmptyView: View {
    var onTryAgain: () -> Void = { }
    
    var body: some View {
        Button {
            onTryAgain()
        } label: {
            VStack {
                Image(systemName: "arrow.trianglehead.clockwise")
                    .frame(width: 44, height: 44)
                Text("Nothing here, try again.")
                    .foregroundStyle(.marvelPrimaryText)
            }
        }
    }
}

#Preview {
    EmptyView()
}
