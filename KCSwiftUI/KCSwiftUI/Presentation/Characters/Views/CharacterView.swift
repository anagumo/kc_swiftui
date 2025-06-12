import SwiftUI

struct CharacterView: View {
    var character: KCCharacter
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.thumbnail ?? "")) { phase in
                phase.image?
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
            }
            Text(character.name)
                .padding(8)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.marvelPrimaryText)
                
        }
        .frame(maxWidth: .infinity, minHeight: 250)
        .background(.marvelPlaceholder)
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
