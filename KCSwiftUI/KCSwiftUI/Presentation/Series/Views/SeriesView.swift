import SwiftUI

struct SeriesView: View {
    @State var seriesViewModel: SeriesViewModel
    
    var body: some View {
        NavigationStack {
            switch seriesViewModel.serieViewState {
            case .none:
                Text("Nothing to show")
            case .loading:
                LoadingView()
            case .loaded:
                List(seriesViewModel.series, id: \.id) { item in
                    SerieView(serie: item)
                }
                .navigationTitle("Series")
            case .empty:
                EmptyView(onTryAgain: {
                    seriesViewModel.load()
                })
            }
        }
        .onAppear {
            seriesViewModel.load()
        }
    }
}

#Preview {
    SeriesView(
        seriesViewModel: SeriesViewModel(
            characterIdentifier: 1009571,
            getSeriesUseCase: GetSeriesUseCase()
        )
    )
}
