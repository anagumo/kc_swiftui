import SwiftUI

struct CharacterView: View {
    var character: Character
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: character.thumbnail ?? "")) { image in
                image
                    .image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            }
            .overlay {
                Rectangle()
                    .foregroundStyle(.marvelBackground)
                    .opacity(0.5)
            }
            Text(character.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.marvelPrimaryText)
                
        }
        .cornerRadius(12)
    }
}

#Preview {
    CharacterView(
        character: Character(
            id:1009150,
            name: "Agent Zero",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790.jpg"
        )
    )
}
