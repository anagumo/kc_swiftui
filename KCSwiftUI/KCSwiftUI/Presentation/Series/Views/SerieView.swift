import SwiftUI

struct SerieView: View {
    var serie: KCSerie
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: serie.thumbnail ?? "")) { phase in
                phase.image?
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .clipped()
            }
            .overlay {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.marvelBackground)
                        .opacity(0.5)
                    Text(serie.title)
                        .padding()
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.marvelPrimaryText)
                }
               
            }
            if let description = serie.description {
                Text(description)
                    .padding(8)
                    .font(.body)
                    .foregroundStyle(.marvelPrimaryText)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 500)
        .background(.marvelPlaceholder)
        .cornerRadius(12)
    }
}

#Preview {
    SerieView(
        serie: KCSerie(
            id: 1009571,
            title: "X-Men (1991 - 2001)",
            description: "An exciting era for Marvel's mutants begin! With a larger team roster than ever before, the X-Men face familiar foes like Magneto, new opponents like Omega Red, and monumental threats including Onslaught and Operation: Zero Tolerance in their 90's exploits!",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/2/e0/513115de77b40.jpg"))
}
