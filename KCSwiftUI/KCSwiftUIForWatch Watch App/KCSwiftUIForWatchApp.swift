import SwiftUI

@main
struct KCSwiftUIForWatch_Watch_AppApp: App {
    @Environment(AppStateViewModel.self) var appState
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
