import SwiftUI

struct RootView: View {
    @Environment(AppStateViewModel.self) var appState
    
    var body: some View {
        switch appState.status {
        case .none:
            EmptyView()
        case .home:
            CharactersView()
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateViewModel())
}
