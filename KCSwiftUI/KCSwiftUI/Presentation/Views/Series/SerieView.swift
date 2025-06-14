import SwiftUI

struct SerieView: View {
    var serie: SerieModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: serie.thumbnail ?? "")) { phase in
                phase.image?
                    .resizable()
                    #if os(iOS)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    #elseif os(watchOS)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    #endif
                    .clipped()
            }
            .overlay {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.marvelBackground)
                        .opacity(0.5)
                    Text(serie.title)
                        .padding()
                        #if os(iOS)
                        .font(.title2)
                        #elseif os(watchOS)
                        .font(.title3)
                        #endif
                        .fontWeight(.semibold)
                        .foregroundStyle(.marvelPrimaryText)
                }
               
            }
            if let description = serie.description {
                Text(description)
                    .padding(8)
                    #if os(iOS)
                    .font(.body)
                    #elseif os(watchOS)
                    .font(.caption)
                    #endif
                    .foregroundStyle(.marvelPrimaryText)
            }
        }
        #if os(iOS)
        .frame(maxWidth: .infinity, minHeight: 400)
        #elseif os(watchOS)
        .frame(maxWidth: .infinity, minHeight: 150)
        #endif
        .background(.marvelSecondaryBackground)
        .cornerRadius(12)
    }
}

#Preview {
    SerieView(
        serie: SerieModel(
            id: 1009571,
            title: "X-Men (1991 - 2001)",
            description: "An exciting era for Marvel's mutants begin! With a larger team roster than ever before, the X-Men face familiar foes like Magneto, new opponents like Omega Red, and monumental threats including Onslaught and Operation: Zero Tolerance in their 90's exploits!",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/2/e0/513115de77b40.jpg"))
}
