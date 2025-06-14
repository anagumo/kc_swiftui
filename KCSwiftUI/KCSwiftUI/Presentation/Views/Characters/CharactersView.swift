import SwiftUI

struct CharactersView: View {
    @State var charactersViewModel: CharactersViewModel
    @State private var itemSelected: KCCharacter?
    
    init(charactersViewModel: CharactersViewModel = CharactersViewModel()) {
        self.charactersViewModel = charactersViewModel
    }
    
    var body: some View {
        NavigationStack {
            switch charactersViewModel.characterViewState {
            case .none:
                Text("Nothing to show")
            case .loading:
                LoadingView()
            case .loaded:
                List(charactersViewModel.characters, id: \.id) { item in
                    Button {
                        itemSelected = item
                    } label: {
                        CharacterView(character: item)
                    }
                }
                #if os(iOS)
                .navigationTitle("Marvel Characters")
                #endif
                .sheet(item: $itemSelected) { item in
                    SeriesView(
                        seriesViewModel: SeriesViewModel(
                            characterIdentifier: item.id
                        )
                    )
                }
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
    CharactersView()
}
