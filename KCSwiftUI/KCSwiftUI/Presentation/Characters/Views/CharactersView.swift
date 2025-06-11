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
                Text("Loaded")
            case .empty:
                Text("Empty")
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
