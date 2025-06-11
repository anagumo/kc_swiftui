import SwiftUI

struct CharactersView: View {
    @State var charactersViewModel: CharactersViewModel
    
    var body: some View {
        NavigationStack {
            switch charactersViewModel.charactersViewState {
            case .none:
                Text("Nothing to show")
            case .loading:
                LoadingView()
            case .loaded:
                List(charactersViewModel.characters, id: \.id) { item in
                    CharacterView(character: item)
                }
                .navigationTitle("Marvel Characters")
            case .empty:
                EmptyView(onTryAgain: {
                    charactersViewModel.load()
                })
            }
        }
        .onAppear {
            charactersViewModel.load()
        }
    }
}

#Preview {
    CharactersView(
        charactersViewModel: CharactersViewModel(
            getCharactersUseCase: GetCharactersUseCase()
        )
    )
}
