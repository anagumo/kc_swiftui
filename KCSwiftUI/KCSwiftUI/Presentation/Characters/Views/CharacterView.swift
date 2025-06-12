import SwiftUI

struct CharacterView: View {
    var character: KCCharacter
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.thumbnail ?? "")) { phase in
                phase.image?
                    .resizable()
                    #if os(iOS)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    #elseif os(watchOS)
                    .frame(maxWidth: .infinity, maxHeight: 120)
                    #endif
                    .clipped()
            }
            Text(character.name)
                
                #if os(iOS)
                .font(.title2)
                #elseif os(watchOS)
                .font(.caption)
                #endif
                .fontWeight(.semibold)
                .foregroundStyle(.marvelPrimaryText)
                
        }
        #if os(iOS)
        .frame(maxWidth: .infinity, minHeight: 250)
        #elseif os(watchOS)
        .frame(maxWidth: .infinity, minHeight: 120)
        #endif
        .padding(8)
        .background(.marvelSecondaryBackground)
        .cornerRadius(12)
    }
}

#Preview {
    CharacterView(
        character: KCCharacter(
            id: 1009571,
            name: "Sentry (Robert Reynolds)",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/f/03/52695b1392c78.jpg"
        )
    )
}
