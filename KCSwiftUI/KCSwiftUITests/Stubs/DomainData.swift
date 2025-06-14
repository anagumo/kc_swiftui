import Foundation
@testable import KCSwiftUI

enum DomainData {
    static let givenCharacterList = [
        CharcterModel(
            id:1009150,
            name: "Agent Zero",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790.jpg"
        ),
        CharcterModel(
            id:1009203,
            name: "Bloodscream",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/6/e0/4c7c647c3f069"
        ),
        CharcterModel(
            id:1009206,
            name: "Box",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/9/e0/4ce59ef63362d.jpg"
        ),
        CharcterModel(
            id:1009178,
            name: "Beef",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c002e0305708.jpg"
        ),
        CharcterModel(
            id:1009177,
            name: "Bedlam",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
        )
    ]
    
    static let givenSerieList = [
        SerieModel(
            id: 543,
            title: "Weapon X (2002 - 2004)",
            description: nil,
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/7/00/4bb66fe856148.jpg"
        ),
        SerieModel(
            id: 34445,
            title: "Life of Wolverine Infinity Comic (2022)",
            description: "Jean Grey scans Wolverine’s mind, bringing us along with her through the long life of the mutant known as Logan, James Howlett, Weapon X, Wolverine and more! For the first time ever, explore the history of Wolverine in chronological order!",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/6/10/65132e8c1b4a7.jpg"
        ),
        SerieModel(
            id: 3643,
            title: "X-Man (1995 - 2000)",
            description: "An exciting era for Marvel's mutants begin! With a larger team roster than ever before, the X-Men face familiar foes like Magneto, new opponents like Omega Red, and monumental threats including Onslaught and Operation: Zero Tolerance in their 90's exploits!",
            thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/9/a0/4bb7bc51b8966.jpg"
        )
    ]
}
