import Foundation

enum Status {
    case none, home
}

@Observable final class AppStateViewModel {
    var status: Status = .none
    
    init() {
        status = .home
    }
}
