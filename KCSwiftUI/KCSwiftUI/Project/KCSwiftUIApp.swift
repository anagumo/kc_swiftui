import SwiftUI

@main
struct KCSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersView(
                charactersViewModel: CharactersViewModel(
                    getCharactersUseCase: GetCharactersUseCase()
                )
            )
        }
    }
}
