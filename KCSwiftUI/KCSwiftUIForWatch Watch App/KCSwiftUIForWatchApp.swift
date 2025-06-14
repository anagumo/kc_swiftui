import SwiftUI

@main
struct KCSwiftUIForWatch_Watch_AppApp: App {
    @State var appState = AppStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
