import SwiftUI

@main
struct KCSwiftUIApp: App {
    @State var appState = AppStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
